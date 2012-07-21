class FacebookController < ApplicationController
  def authorize_posting
    client = FacebookApp.auth("http://localhost:3000/facebook/authorize_posting/").client
    client.authorization_code = params[:code]
    access_token = client.access_token! :client_auth_body
    user = FbGraph::User.me(access_token).fetch    
    logger.info { "#{user.identifier}" }
    
    FacebookProfile.find_or_create_by_profile_id(user.identifier,{:customer_id => 1, :access_token => access_token.to_s})
   render :text => "Ok" 
  end
end
