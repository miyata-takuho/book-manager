class UserMailer < ApplicationMailer
  default from "test@example.com"

  def start_borrowing_email
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Thank you for borrowing the book')
  end
end
