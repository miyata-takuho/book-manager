class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :books_params, only: [:create]

  def index
    @books = Book.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.save
    @book.user.update!(status: true, book_id: @book.id)
    @rental_log = @book.start_borrowing(@book.id, @book.user.id)
    @book.update!(status: :borrowed, rental_logs_id: @book.last_rental_log.id, borrowed_by: current_user.name)
    if @book.save
      render "books/show"
    else
      render "books/new"
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.title = params[:title]
    @book.description = params[:description]
    @book.rating = params[:rating]
    @book.update(books_params)
    redirect_to("/books")
  end


  def edit
    @book = Book.find_by(id: params[:id])
  end

  def destroy
    @book= Book.find_by(id: params[:id])
    @book.destroy
    redirect_to("/books")
  end

  def return_book
    @book = Book.find_by(id: params[:id])
  end

  def rental
    @book= Book.find_by(id: params[:id])
    @book.user.update!(status: true, book_id: @book.id)
    @rental_log = @book.start_borrowing(@book.id, @book.user.id)
    @book.update!(status: :borrowed, rental_logs_id: @book.last_rental_log.id, borrowed_by: current_user.name)
    if @book.save
      redirect_to("/books")
    end
  end

  def return
    @book = Book.find_by(id: params[:id])
    @book.user.update!(status: false, book_id: nil)
    @rental_log = @book.return_rental_book(@book.id)
    @book.update(books_params)
    @book.update!(status: :not_borrowed, rating: @book.average_rating)
    if @book.save
      redirect_to("/books")
    end
  end

private
 # Never trust parameters from the scary internet, only allow the white list through.
 def books_params
   params.require(:book).permit(:title, :description, :user_id, :rating, :rating_sum, :rental_logs_id)
 end

end
