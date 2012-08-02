class Customer < ActiveRecord::Base
  has_many :social_network_pages, :as => :source
  has_many :reviews
  belongs_to :company
  
  validates_uniqueness_of :email, :on => :save, :message => " must be unique", :allow_blank => true, :allow_nil => true, :scope => :company_id
  
end
