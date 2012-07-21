class FacebookApp
  class << self
    def auth(redirect_uri =  nil)
      FbGraph::Auth.new FACEBOOK_SETTINGS[:api_key], FACEBOOK_SETTINGS[:api_secret], :redirect_uri => redirect_uri
    end
  end
end