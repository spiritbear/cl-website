class Customer < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :social_network_pages, :as => :source
  has_and_belongs_to_many :companies
end
