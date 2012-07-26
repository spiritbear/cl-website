class SyndicationPost < ActiveRecord::Base

  state_machine :state, :initial => :created do
    
    event :attempt do
      transition [:created, :attempted] => :attempted
    end  
    
    event :fail do
      transition [:created, :attempted] => :failed
    end
    
    event :succeed do
      transition :attempted => :finished
    end
    
    after_transition :on => :attempt, :do => :update_attempts
    
  end
  
  # updates the number of attempts
  def update_attempts
    attempt_count = self.attempts
    self.update_attributes({:attempts => attempt_count + 1})
  end
  
  
end
