class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.send_mail(@feedback, current_user).deliver_now
      redirect_to root_path, notice: 'OK'
    else
      render :new, alert: 'Error'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end

end
