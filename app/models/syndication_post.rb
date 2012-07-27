class SyndicationPost < ActiveRecord::Base
  
  belongs_to :social_network_page
  belongs_to :review

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
    
    after_transition :on => [:attempt, :fail], :do => :update_attempts
    
  end
  
  # updates the number of attempts
  def update_attempts
    attempt_count = self.attempts
    self.update_attributes({:attempts => attempt_count + 1})
  end
  
  def post
    if self.social_network_page.instance_of? FacebookPage
      self.post_to_facebook
    elsif self.social_network_page.instance_of? TwitterPage
      self.post_to_twitter
    end
  end
  
  
  # Posts a review to facebook
  def post_to_facebook
    sn_page = self.social_network_page
    review = self.review
    
    user = FbGraph::User.me(sn_page.access_token)
    
    payload = {
      :message => "I wrote a review of #{review.company.name} in #{review.company.city}, #{review.company.state}",
      :name => review.summary,
      :link => "reviews/#{review.company.id}/#{review.company.slug}/review/#{review.id}?main_page=1}"
      :picture => "http://localhost:3000/images/outside/rounded_square.gif",
      :caption => "#{review.company.name} Customer Reviews at CustomerLobby.com"
      :description => "#{review.content[0 .. 100]} ..."
    }
        
    begin
      result = user.feed!(payload)
    rescue Exception => e
      @fail_reason = e.message
    end        
    
    self.attempt
    self.reload
    
    if (self.attempts > 5)
      self.fail
      self.update_attributes(:notes => @fail_reason)
    end  
    
  end
  
  def post_to_twitter
  end
  
  
  
end
