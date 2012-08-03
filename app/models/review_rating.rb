class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :review
  belongs_to :review_topic
  
end
