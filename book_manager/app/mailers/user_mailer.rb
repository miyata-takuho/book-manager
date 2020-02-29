class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def welcome_email(user)
    @user = User.last
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to book manager')
  end

end
