class ReviewsController < ApplicationController
  def new
    result = nil
    
    begin
      logger.info { "#{cookies.to_yaml}" }
      result = FacebookApp.auth.from_cookie(cookies)
    rescue FbGraph::Auth::VerificationFailed  => e
      logger.info { "#{e}" }
      client = FacebookApp.auth("http://localhost:3000/facebook/authorize_posting/").client
    end    
        
    
    if client.present?
      @authorization_url = client.authorization_uri(:scope => [:publish_stream])
      logger.info { "#{client}" }
    end
    
  end
end
