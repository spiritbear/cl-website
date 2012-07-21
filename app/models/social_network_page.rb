class SocialNetworkPage < ActiveRecord::Base
  # attr_accessible :title, :body
  
  state_machine :initial => :disabled do
  end
end
