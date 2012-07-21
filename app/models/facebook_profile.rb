class FacebookProfile < ActiveRecord::Base
  # attr_accessible :title, :body
  state_machine :state, :initial => :active do
  end

end
