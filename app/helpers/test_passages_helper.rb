module TestPassagesHelper

  def test_cur_question(test_passage)
    "#{test_passage.current_question_index}"
  end

  def test_all_questions(test_passage)
    "#{test_passage.test.questions.count}"
  end

  def test_done_message(test_passage)
    test_passage.test_success_done? ? 'Completed' : 'Failed'
  end
end
