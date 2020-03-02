class ReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id, book_id, rental_log)
    if rental_log.status == 'borrowing'
      rental_log.update!(status: :a_day_left)
      UserMailer.delay.one_day_left_notice(user_id, book_id, rental_log)
    end
  end
end
