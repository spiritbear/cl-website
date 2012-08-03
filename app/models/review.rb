class Review < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :company
  belongs_to :customer
  has_many :review_ratings
  scope :published, where(:state => "published")
  scope :rejected, where(:state => "rejected")
  scope :pending,  where(:state => "pending")
  
  
  def publish?
    self.state == "publish"
  end
    
end
