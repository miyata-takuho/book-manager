class RentalLogController < ApplicationController
  before_action :authenticate_user!
  before_action :rental_logs_params, only: [:create]

  def index
  end

  def new
    @rental_log = RentalLog.new
  end

  def create
    @book = Book.find(params[:id])
    @rental_log = RentalLog.new(book_id: @book.id)
    @rental_log.save
    if @rental_log.save
      render "books/show"
    else
      render "books/new"
    end
  end

  def show
  end

  def update
  end


  def edit
  end

  def destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def rental_logs_params
   params.require(:rental_logs).permit(:status, :book_id)
  end

end
