class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.guest_answer.subject
  #
  def confirmation(answer)
    @answer = answer
    mail(to: "louiseguillaume2019@gmail.com", subject: "Vous avez reçu une nouvelle réponse !")

  end
end
