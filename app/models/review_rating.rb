class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :review
  
  
end
