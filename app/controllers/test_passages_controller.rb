class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      get_badges(@test_passage) if @test_passage.test_success_done?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(user: @test_passage.user, question: @test_passage.current_question, url: result.gist.html_url)

      flash[:notice] = view_context.link_to(t('.success'), result.gist.html_url)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  def get_badges(test_passage)
    badges = BadgeTestService.new(test_passage).call

    unless badges.empty?
      current_user.badges << badges
      flash[:notice] = t('services.badge.success')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
