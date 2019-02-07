class TestPassage < ApplicationRecord

  SUCCESS_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def test_success_done?
    success_progress >= SUCCESS_SCORE
  end

  def success_progress
    (correct_questions.to_f / test.questions.count) * 100
  end

  def current_question_index
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def have_time?
    if test.timer_not_nil_zero
      calc_time_left.positive? ? true : false
    else
      true
    end
  end

  def calc_time_left
    if test.timer_not_nil_zero
      (created_at + test.timer.minutes - Time.current).to_i
    end
  end

  private

  def before_validation_set_question
    if current_question.nil? && test.present?
      self.current_question = test.questions.first
    else
      self.current_question = test.questions
                                  .order(:id)
                                  .where('id > ?', current_question.id)
                                  .first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.true_answer
  end

end
