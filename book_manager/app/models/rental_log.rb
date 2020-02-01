class RentalLog < ApplicationRecord
  belongs_to :books, optional: true
  belongs_to :users, optional: true
  enum status: [ :before_rental, :first_day, :five_days_left, :a_day_left, :overdue ]
  # after_create :create_due

  # def initialize
  #   RentalLog.due = RentalLog.created_at + 14.days
  # end


  # def add_job
  #   book.delay(owner: self).do_rental if book.present?
  # end

end
