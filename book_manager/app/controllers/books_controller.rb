class BooksController < ApplicationController
  before_action :authenticate_user!
  def show
    @books = Book.find_by(id: params[:id])
  end

  def index
    @books = Book.all
  end

  def create
    @books = current_user.books.new(books_params)
    @books.save
    if @books.save
      redirect_to("/books/index", notice: "Book was successfully created!")
    end
  end

  def update
    @books = Book.find_by(id: params[:id])
    @books.title = params[:title]
    @books.description = params[:description]
    @books.save
    redirect_to("/books/index")
  end

  def new
    @books = Book.new
  end

  def edit
    @books = Book.find_by(id: params[:id])
  end

  def destroy
    @books= Book.find_by(id: params[:id])
    @books.destroy
    redirect_to("/books/index")
  end

 # def form_for
 #   @books = current_user.books.new(title: params[:title], description: params[:description])
 #   @books.save
 #   redirect_to("/books/index")
 # end

 private

 # Never trust parameters from the scary internet, only allow the white list through.

  def books_params
    params.permit(:id, :title, :description, :user_id, :username, :name)
  end
end
