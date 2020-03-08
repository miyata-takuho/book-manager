class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def welcome_email(user)
    @user = User.last
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to book manager')
  end

  def start_borrowing_mail(user_id, book_id, rental_log)
    @user = User.find(user_id)
    @book = Book.find(book_id)
    @rental_log = rental_log
    mail(to: @user.email, subject: 'Thank you for borrowing')
  end

  def one_day_left_notice(user_id, book_id, rental_log)
    @user = User.find(user_id)
    @book = Book.find(book_id)
    @rental_log = rental_log
    mail(to: @user.email, subject: 'Due date is tomorrow')
  end

  def due_date_notice(user_id, book_id, rental_log)
    @user = User.find(user_id)
    @book = Book.find(book_id)
    @rental_log = rental_log
    mail(to: @user.email, subject: 'You need to return the book')
  end

  def please_return_notice(user_id, book_id, rental_log)
    @user = User.find(user_id)
    @book = Book.find(book_id)
    @rental_log = rental_log
    mail(to: @user.email, subject: 'Please return your borrowing book')
  end
end
