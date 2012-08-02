class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.login_field = :email
  end
  
  validates_uniqueness_of :email, :on => :save, :message => " must be unique"

  state_machine :state, :initial => :disabled do
  end
  
  belongs_to :sales_team
  belongs_to :company  
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
