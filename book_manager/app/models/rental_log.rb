class RentalLog < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true
  validates :user_id, {presence: true}
  validates :book_id, {presence: true}
  enum status: [ :available, :borrowing, :a_day_left, :due_date, :overdue, :three_days_from_due ]
  after_create :start_borrowing_mail

  def start_borrowing_mail
    UserMailer.delay.start_borrowing_mail(user_id, book_id, self)
  end

  def self.update_status
    borrowed_logs = RentalLog.all
    borrowed_logs.each do |borrowed_log|
      if borrowed_log.status == 'borrowing' && borrowed_log.a_day_before_due == borrowed_log.today
        borrowed_log.update!(status: :a_day_left)
        UserMailer.delay.one_day_left_notice(borrowed_log.user_id, borrowed_log.book_id, borrowed_log)
      elsif borrowed_log.status == 'a_day_left' && borrowed_log.due_date == borrowed_log.today
        borrowed_log.update!(status: :due_date)
        UserMailer.delay.due_date_notice(borrowed_log.user_id, borrowed_log.book_id, borrowed_log)
      elsif borrowed_log.status == 'due_date' && borrowed_log.due_date < borrowed_log.today
        borrowed_log.update!(status: :overdue)
        UserMailer.delay.please_return_notice(borrowed_log.user_id, borrowed_log.book_id, borrowed_log)
      elsif borrowed_log.status == 'overdue' && borrowed_log.overdue_date == borrowed_log.today
        borrowed_log.update!(status: :three_days_from_due)
        UserMailer.delay.please_return_notice(borrowed_log.user_id, borrowed_log.book_id, borrowed_log)
      end
    end
  end

  def self.same_book_logs(book_id)
    log_array = RentalLog.where(book_id: book_id)
    log_array.reverse
  end

  def self.unique_user_array(book_id)
    same_book_logs = RentalLog.same_book_logs(book_id)
    logs_user_ids = same_book_logs.map{ |book_log| book_log.user_id }
    unique_user_ids = logs_user_ids.uniq
  end

  def self.all_borrowed_user_name(book_id)
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

  def self.borrowed_user_name(book_id)
    unique_user_ids = RentalLog.unique_user_array(book_id)
    if unique_user_ids.count > 2
      two_users = unique_user_ids[0..1]
      logs_user_name = two_users.map do |unipue_user_id|
        same_user = User.where(id: unipue_user_id)
        same_user.map{ |user_ary| user_ary.name}
      end.join(', ')
    else
      RentalLog.all_borrowed_user_name(book_id)
    end
  end

  def overdue_date
    t = due + 3.days
    t.strftime("%F-%a")
  end

  def today
    t = Time.now
    t.strftime("%F-%a")
  end

  def borrowed_date
    t = created_at
    t.strftime("%F-%a") if t.present?
  end

  def a_day_before_due
    t = due - 1.day
    t.strftime("%F-%a") if t.present?
  end

  def due_date
    t = due
    t.strftime("%F-%a") if t.present?
  end

  def return_date
    t = returned_at
    t.strftime("%F-%a") if t.present?
  end

  def blank_stars
    5 - rating.to_i
  end
end
