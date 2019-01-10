module TestsHelper
  def test_header(test)
    handler = test.new_record? ? 'Create new' : 'Edit'
    "#{handler} #{test.title} test"
  end
end
