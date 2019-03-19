# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/guest_answer
  def confirmation
    answer = Answer.last
    AdminMailer.confirmation(answer)
  end

end
