class ReviewTopic < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :review_ratings
  belongs_to :default_review_topic
  
  scope :active, where(:state => "active")
end
