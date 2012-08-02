class UsersController < ApplicationController
  layout 'admin'
  
  def new
    @company = Company.first
    @user = User.new(:company => @company)
  end
  
  def create
    @company = Company.first
    @user = CompanyUser.new(params[:user].merge(:company_id => @company.id))    
    @user.save
    render :text => "Ok"
  end
  
  def index
    @users = Company.first.users
    # render :text => "Ok"
  end
end
