class BooksController < ApplicationController
  def show
   end
   def index
     @books = Book.where(params[:id])
     @books.each do |book|
        book.title
      end
   end

   def create
     @books = Book.create
      if @books.save
       render("books/index")
      else
       render("main/home")
      end
    end

   def new
     @books = Book.new
   end
 end
