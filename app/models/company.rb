class Company < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :soial_network_pages, :as => :source
  has_many :customers
  has_and_belongs_to_many :categories
  has_many :users
  
  def get_statistics_for_graph
    published_reviews = self.reviews.published
    
    published_review_count = published_reviews.count
    approved_reviews_count = published_reviews.where("total_score > 0.6") .count
    
  end
end
