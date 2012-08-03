class DefaultReviewTopic < ActiveRecord::Base
  # attr_accessible :title, :body
  scope :active, where(:state => "active")
  scope :disabled, where(:state => "disabled")
  
  has_many :review_topics
end
