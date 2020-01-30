class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_one :rental_log, dependent: :destroy
      # attr_accessor :title, :description
  validates :title, {presence: true}
  enum status: [ :not_borrowed, :borrowed ]

   def blank_stars
     5 - rating.to_i
   end

   def start_borrowing(book_id, user_id)
     RentalLog.create!(status: :first_day, book_id: book_id, user_id: user_id)
   end
end
