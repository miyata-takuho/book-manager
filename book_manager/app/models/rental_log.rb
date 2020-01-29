class RentalLog < ApplicationRecord
  belongs_to :books
  belongs_to :users
  enum status: [ :before_rental, :first_day, :five_days_left, :a_day_left, :overdue ]
  # after_create :add_job


  # def add_job
  #   book.delay(owner: self).do_rental if book.present?
  # end

end
