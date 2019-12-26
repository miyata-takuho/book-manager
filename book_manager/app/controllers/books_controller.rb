class BooksController < ApplicationController
  before_action :authenticate_user!
  def show
    @book = Book.find_by(id: params[:id])
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(title: params[:title], description: params[:description])
    @book.save
    redirect_to("/books/index")
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.title = params[:title]
    @book.description = params[:description]
    @book.save
    redirect_to("/books/index")
  end

  def new
    @book = Book.new(id: params[:id])
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def destroy
    @book= Book.find_by(id: params[:id])
    @book.destroy
    redirect_to("/books/index")
  end

 # def form_for
 #   @book = Book.new
 #   @book.save
 #   redirect_to("/books/index")
 # end

 private

 # Never trust parameters from the scary internet, only allow the white list through.

 def books_params

params.require(:books).permit(:id, :title, :description)

 end

end
