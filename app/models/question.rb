class Question < ActiveRecord::Base
  attr_accessor :email, :first_name, :last_name
  belongs_to :review
  belongs_to :customer
end
