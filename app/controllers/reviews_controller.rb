class ReviewsController < ApplicationController
  def new
    
    
    @authorzied = true
    begin
      result = FacebookApp.auth.from_cookie(cookies)
    rescue FbGraph::Auth::VerificationFailed  => e
      client = FacebookApp.auth("http://localhost:3000/facebook/authorize_posting/").client
      @authorized = false
    end    
        
    
    if client.present?
      @authorization_url = client.authorization_uri(:scope => [:publish_stream,:email])
      logger.info { "#{client}" }
    end    
  end
  
  def create
    result = FacebookApp.auth.from_cookie(cookies)
    user = FbGraph::User.me(result.access_token.to_s).fetch
    company = Company.first
    customer = Customer.find_or_create_by_email(params[:email],{:first_name => params[:first_name], :last_name => params[:last_name]})
    sn_page = customer.social_network_pages.find_by_page_id_and_type(user.identifier,"FacebookPage")
    if sn_page.blank?
      sn_page = FacebookPage.new do |fp|
        fp.source = customer
        fp.access_token = user.access_token.to_s
        fp.category = "profile"
        fp.page_id = user.identifier
        fp.page_name = user.name
      end
      
      sn_page.save
      logger.info { "#{sn_page.to_yaml}" }
    end
    render :text => "Ok"
  end
  
  def rate
    params[:score] = params[:score] / 5.0
    params[:ip_address] = request.ip
    
    @review = Review.find(params[:review_id])
    @review.review_ratings.create(params)
    
    render :text => "Ol"
  end
end
