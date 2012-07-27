class Review < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :company
  belongs_to :customer
  
  def publish?
    self.state == "publish"
  end
    
end
