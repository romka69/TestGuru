class FeedbacksMailer < ApplicationMailer

  default to: -> { Admin.all.pluck(:email) }

  def send_mail(feedback, user)
    @user = user
    @body = feedback.body

    mail from: @user.email,
         subject: "New feedback from #{@user.first_name}"
  end

end
