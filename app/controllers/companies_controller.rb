class CompaniesController < ApplicationController
  layout 'admin'
  
  def index
    @invite = Customer.new
  end
  
  def create
    render :text => "Ok"
  end
end
