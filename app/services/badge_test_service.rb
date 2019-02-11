class BadgeTestService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("check_#{badge.rule}?", badge.param)
      #get_badge(badge) if send("check_#{badge.rule}?", badge.param)
    end
  end

  private

  def check_finish_tests_by_category?(category)
    ids = Test.sort_name_category(category).ids
    category == @test.category.title && param_ids_equally_tests_ids?(ids)
  end

  def check_first_try?(_params)
    @user.test_passages.where(test: @test).count == 1
  end

  def check_finish_tests_by_level?(level)
    ids = Test.where(level: level).ids
    level.to_i == @test.level && param_ids_equally_tests_ids?(ids)
  end

  def param_ids_equally_tests_ids?(ids)
    ids.count == @user.test_passages.where(test_id: ids).success.uniq.count
  end

  #def get_badge(badge)
  #  @user.badges << badge
  #end

end
