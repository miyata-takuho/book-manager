class RentalLog < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true
  validates :user_id, {presence: true}
  validates :book_id, {presence: true}
  enum status: [ :available, :borrowing, :a_day_left, :overdue ]
  # after_create :create_due

  # def initialize
  #   RentalLog.due = RentalLog.created_at + 14.days
  # end

  # def add_job
  #   book.delay(owner: self).do_rental if book.present?
  # end

  def self.same_book_logs(book_id)
    RentalLog.where(book_id: book_id)
  end

  def self.unique_user_array(book_id)
    same_book_logs = RentalLog.same_book_logs(book_id)
    logs_user_ids = same_book_logs.map{ |book_log| book_log.user_id }
    unique_user_ids = logs_user_ids.uniq
  end

  def self.borrowed_user_name(book_id)
    unique_user_ids = RentalLog.unique_user_array(book_id)
    logs_user_name = unique_user_ids.map do |unipue_user_id|
      same_user = User.where(id: unipue_user_id)
      same_user.map{ |user_ary| user_ary.name}
    end.join(', ')
  end

  def self.borrowed_user_size(book_id)
    unique_user_array = RentalLog.unique_user_array(book_id)
    unique_user_array.count
  end

  def self.two_borrowed_user_name(book_id)
    unique_user_ids = RentalLog.unique_user_array(book_id)
    logs_user_name = unique_user_ids.map do |unipue_user_id|
      same_user = User.where(id: unipue_user_id)
      same_user.map{ |user_ary| user_ary.name}
      #untilを使って二つだけ返すようにする
  end

end
