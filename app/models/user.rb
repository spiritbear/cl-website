class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.login_field = :email
  end
  
  state_machine :state, :initial => :disabled do
  end
  
  belongs_to :sales_team
    
end
