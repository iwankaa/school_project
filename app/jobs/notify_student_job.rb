class NotifyStudentJob < ApplicationJob
  queue_as :default
  self.queue_adapter = :sidekiq

  def perform(student_id)
    student = ::Student.find student_id
    logger.info " Starting background job "
    student.notify_student
    logger.info " Job's done "
  end
end
