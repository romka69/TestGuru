class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :count_max_answers, on: create

  scope :true_answer, -> { where(correct: true) }

  private

  def count_max_answers
    errors.add(:question, "maximum 4 answers!") if question.answers.count >= 4
  end
end
