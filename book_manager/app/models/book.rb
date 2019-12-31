class Book < ApplicationRecord
  belongs_to :user
   attr_writer :title, :description
  # validates :user_id, {presence: true}

  def new
    @book = Book.new(books_params)
  end
end
