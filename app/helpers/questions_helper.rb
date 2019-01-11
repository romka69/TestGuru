module QuestionsHelper
  def question_header(question)
    handler = question.new_record? ? 'Create new' : 'Edit'
    "#{handler} question in #{question.test.title} test"
  end
end
