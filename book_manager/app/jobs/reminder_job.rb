class ReminderJob < ApplicationJob
  # belongs_to :rental_log
  queue_as :default
  # after_perform :due_date_mail

  def perform(user_id, book_id, rental_log)
    if rental_log.status == 'a_day_left' && rental_log.a_day_before_due == rental_log.today
      # rental_log.update!(status: :a_day_left)
      UserMailer.delay.one_day_left_notice(user_id, book_id, rental_log)
    elsif rental_log.status == 'due_date' && rental_log.due_date == rental_log.today
      # rental_log.update!(status: :due_date)
      UserMailer.delay.due_date_notice(user_id, book_id, rental_log)
    end
  end

  # def due_date_mail
  #   if rental_log.status == 'a_day_left'
  #     ReminderJob.set(wait: 2.minute).perform_later(user_id, book_id, self)
  #     # rental_log.update!(status: :due_date)
  #     # UserMailer.delay.due_date_notice(user_id, book_id, rental_log)
  #   end
  # end
end
