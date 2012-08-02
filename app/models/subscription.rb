class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def check_status
    result = Cybersource.retrieve(";#{subscription_id}",:order_id => "#{order_id}")
    
    if result.decision == "ACCEPT"
      self.update_attributes(:state => "accept", :last_check_date => Time.now)
      
    else
      
    end
    
  end
  
  # terminates a cybersource account
  def terminate
    result = Cybersource.unstore(";#{subscription_id}",:order_id => "#{order_id}")
    if result.success == true
      self.update_attributes({:state => "delete", :note => "User Requested Deletion"})
    end
  end
  
  def order_id
    "CL{company_id}"
  end
  
  
  class << self
    def auth
    end
  end
end
