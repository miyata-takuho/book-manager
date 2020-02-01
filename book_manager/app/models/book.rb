class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :rental_logs, dependent: :destroy
      # attr_accessor :title, :description
  validates :title, {presence: true}
  enum status: [ :not_borrowed, :borrowed ]

   def blank_stars
     5 - rating.to_i
   end

   def start_borrowing(book_id, user_id)
     RentalLog.create!(status: :first_day, book_id: book_id, user_id: user_id, due: Time.now + 14.days)
   end

   def return_rental_book(book_id)
     book = Book.find_by(id: book_id)
     return_book = RentalLog.find_by(book_id: book_id, id: book.last_rental_log.id)
     return_book.update!(returned_at: Time.now, status: :before_rental)
     return_book.save
   end

   def last_rental_log
     if rental_logs.present?
       rental_logs.last
     end
   end

   def last_log_borrowed_date
     if last_rental_log.present?
       t = last_rental_log.created_at
       t.strftime("%F-%a") if t.present?
     end
   end

   def last_log_due_date
     if last_rental_log.present?
       t = last_rental_log.due
       t.strftime("%F-%a") if t.present?
     end
   end

   def last_log_returned_date
     if last_rental_log.present?
       t = last_rental_log.returned_at
       t.strftime("%F-%a") if t.present?
     end
   end
end
