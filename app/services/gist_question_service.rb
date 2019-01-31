class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @gist_answer = @client.create_gist(gist_params)
  end

  def success?
    @gist_answer[:html_url].present?
  end

  private

  def default_client
    Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
