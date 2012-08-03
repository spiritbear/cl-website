class Company < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :soial_network_pages, :as => :source
  has_many :customers
  has_and_belongs_to_many :categories
  has_many :users
  has_many :review_topics
  has_many :reviews
  
  def get_statistics_for_graph
    published_reviews = self.reviews.published
    
    published_review_count = published_reviews.count
    approved_reviews_count = published_reviews.where("total_score > 0.6") .count
    
  end
  
  def average_scores_by_topics
    self.review_topics.joins(:default_review_topic).select("default_review_topics.title as title, average_score")
  end
    
end
