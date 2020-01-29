class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :books_params, only: [:create]

  def index
    @books = Book.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    @rental_log = RentalLog.find_by(book_id: @books.ids)
  end

  def new
    @books = Book.new
  end

  def create
    @books = Book.new(books_params)
    @books.save
    if @books.save
      render "books/show"
    else
      render "books/new"
    end
  end

  def show
    @books = Book.find_by(id: params[:id])
  end

  def update
    @books = Book.find_by(id: params[:id])
    @books.title = params[:title]
    @books.description = params[:description]
    @books.rating = params[:rating]
    @books.update(books_params)
    redirect_to("/books")
  end


  def edit
    @books = Book.find_by(id: params[:id])
  end

  def destroy
    @books= Book.find_by(id: params[:id])
    @books.destroy
    redirect_to("/books")
  end

  def rental
    @books= Book.find_by(id: params[:id])
    @books.user.update!(status: true, book_id: @books.id)
    @rental_log = RentalLog.new(status: 1, book_id: @books.id, user_id: @books.user.id)
    @rental_log.save
    @books.update!(status: :borrowed, rental_logs_id: @rental_log.id)
    if @books.save
      redirect_to("/books")
    end
  end

private
 # Never trust parameters from the scary internet, only allow the white list through.
 def books_params
   params.require(:book).permit(:title, :description, :user_id, :rating, :rental_logs_id)
 end

end
