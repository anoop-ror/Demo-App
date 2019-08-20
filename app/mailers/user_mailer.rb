class user1Mailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email
    @user1 = params[:user1]
    @url  = 'http://example.com/login'
    mail(to: @user1.email, subject: 'Welcome to My Awesome Site')
  end
end
