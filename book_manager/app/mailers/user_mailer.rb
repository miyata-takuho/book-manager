class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def welcome_email(user)
    @user = User.last
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to book manager')
  end

  # def welcome_send(user)
  #   @user = user
  #   mail to: user.email, subject: "Welcome to book manager", from: "test@example.com"
  # end

end
