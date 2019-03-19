class Answer < ApplicationRecord
  validates :name, :email, presence: true
  validates_email_format_of :email, :message => 'is not looking good 🤬'

  after_create :send_notification

  private

  def send_notification
    AdminMailer.confirmation(self).deliver_now
  end
end
