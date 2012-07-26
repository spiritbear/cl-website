class Company < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :soial_network_pages, :as => :source
  has_and_belongs_to_many :customers
end
