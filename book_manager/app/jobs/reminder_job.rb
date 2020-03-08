class ReminderJob < ApplicationJob
  queue_as :default

  def perform

  end
end
