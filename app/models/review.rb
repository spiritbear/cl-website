class Review < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :company
  belongs_to :customer
  has_many :review_ratings
  scope :published, where(:state => "published")
  scope :unpublished, where(:state => "unpublished")
  
  
  def publish?
    self.state == "publish"
  end
    
end
