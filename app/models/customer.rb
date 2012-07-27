class Customer < ActiveRecord::Base
  has_many :social_network_pages, :as => :source
  has_many :reviews
  has_and_belongs_to_many :companies
end
