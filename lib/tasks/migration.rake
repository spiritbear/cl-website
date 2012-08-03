# require "rubygems"
# require "data_mapper"
# 
namespace :migration do
  desc "Migrate To New Stats Table"
  task :migrate_stats => :environment do
    client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "customerlobby")
    # client.query("SELECT * from customerPageView").each do |r|
    #   result = Stat.where("company_id = ?  AND month_id = ?", r["company_id"], r["month"])
    #   if result.blank?
    #     Stat.create(:company_id => r["company_id"], :month_id => r["month"], :pages_view_count => r["views"])
    #   end      
    # end
    
    client.query("SELECT * from customerReviewsView").each do |r|
      result = Stat.where("company_id = ?  AND month_id = ?", r["company_id"], r["month"]).first
      if result.blank?
        Stat.create(:company_id => r["company_id"], :month_id => r["month"], :reviews_view_count => r["views"])
      else
        result.update_attributes(:reviews_view_count => r["views"])
      end      
    end
    
    # client.query("SELECT * from monthlyStatistics").each do |r|
    #   result = Stat.where("company_id = ?  AND month_id = ?", r["company_id"], r["month"]).first
    #   if result.blank?
    #     Stat.create(
    #     :company_id => r["company_id"], 
    #     :month_id => r["month"], 
    #     :logo_views_count => r["logo_views"], 
    #     :new_reviews_count => r["new_reviews"], 
    #     :total_reviews_count => r['total_reviews'], 
    #     :view_conversion => r['view_conversion'], 
    #     :new_reviews_average_score => r['new_reviews_avg_score'],
    #     :approval_rating => r['approval_rating']
    #     )
    #   else
    #     result.update_attributes(
    #     :logo_views_count => r["logo_views"], 
    #     :new_reviews_count => r["new_reviews"], 
    #     :total_reviews_count => r['total_reviews'], 
    #     :view_conversion => r['view_conversion'], 
    #     :new_reviews_average_score => r['new_reviews_avg_score'],
    #     :approval_rating => r['approval_rating']        
    #     )
    #   end      
    # end
    
  end
  
  task :migrate_categories => :environment do
   client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "customerlobby") 
   client.query("SELECT * from category").each do |r|
    Category.create(:name => r['category_name'])
   end     
  end
  
  task :migrate_default_topics => :environment do
    client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "customerlobby") 
    client.query("SELECT * from defaultReviewTopic").each do |r|
     DefaultReviewTopic.create(:title => r['topic'], :sort_order => r['display_order'])
    end         
    
    client.query("SELECT * from reviewTopic").each do |r|
         if r['current_order'] == 0
           state = "disabled"
         else
           state = "active"
         end   
         
         result = client.query("SELECT * FROM defaultReviewTopic where topic = '#{r['review_topic']}'").first
         begin
          s = ReviewTopic.new do |x|
            x.id = r['review_topic_id'] 
            x.company_id = r['company_id']
            x.state = state 
            x.average_score = r['average_score']
            x.default_review_topic_id = result['topic_id']
          end
          s.save!
         rescue Exception => e      
         end
        end
    
    client.query("SELECT * from reviewXrefReviewTopic").each do |r|         
            s = ReviewRating.new do |x|    
              x.review_id = r['review_id']
              x.review_topic_id = r['review_topic_id']
              x.score = r['rating']
            end
            s.save!
      
    end
    
  end
  
  task :migrate_reviews => :environment do
    client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "customerlobby") 
    client.query("SELECT * from review where company_id=127").each do |r|
      review = Review.new do |x|
        x.id = r['review_id']
        x.company_id = r['company_id']
        x.customer_id = r['contact_id']
        x.written_date = r['review_date'].to_date rescue Date.today
        x.summary = r['review_summary']
        x.content = r['review_body']
        x.ip_address = r['ip_address']
        x.reviewer_city = r['reviewer_location_city']
        x.reviewer_state = r['reviewer_location_state']
        x.created_at = r['date_modified']
        x.updated_at = r['date_modified']
        x.average_score = r['total_score']
        if r['review_status'] == "publish"
          state = "published"
        elsif r['review_status'] == "pending"
          state = 'pending'
        elsif r['review_status'] == "not_publish"
          state = 'rejected'
        end      
        
        x.state = state
      end
      
      review.save
    end
  end

end