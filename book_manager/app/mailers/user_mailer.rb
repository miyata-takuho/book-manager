class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def welcome_email(user)
    @user = User.last
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to book manager')
  end

  def start_borrowing_mail(user_id, book_id, rental_log)
    @user = User.find_by(id: user_id)
    @book = Book.find_by(id: book_id)
    @rental_log = rental_log
    mail(to: @user.email, subject: 'Thank you for borrowing')
  end

end
