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

end