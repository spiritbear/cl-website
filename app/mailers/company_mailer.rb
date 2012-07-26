class CompanyMailer < ActionMailer::Base
  def support_email(params)
    mail(:to => "CustomerLobby Support <customerservice@customerlobby.com>", :subject => params[:subject])
  end
end