class SalesTeam < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users, :conditions => "type = 'SalesRep'"
end
