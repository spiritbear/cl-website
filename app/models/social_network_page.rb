class SocialNetworkPage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :source, :polymorphic => true
  
  state_machine :initial => :disabled do
  end
end
