class MainController < ApplicationController
  def home
     @books = Book.new
  end

  # def create
  #   @books = Book.save
  #   if @books.save
  #     redirect_to("/books/index")
  #   else
  #     render("main/home")
  # end
  # end

  def user
  end

  def book
  end
end
