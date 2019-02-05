class FeedbacksMailer < ApplicationMailer

  def send_mail(feedback)
    @user = feedback.user
    @body = feedback.body

    mail to: 'romka69tver@yandex.ru',
         from: @user.email,
         subject: "New feedback from #{@user.first_name}"
  end

end
