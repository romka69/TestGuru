class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  def new
  end

  def show
    body = @question.body

    render plain: body
  end

  def create
    question = @test.questions.create(question_params)

    if question.save
      render plain: "'#{question.body}' was created"
    else
      render plain: "Not created, unknown error"
    end
  end

  def destroy
    question = @question.destroy

    render plain: "'#{question.body}' was deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
