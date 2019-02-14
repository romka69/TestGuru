class BadgeTestService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("check_#{badge.rule}?", badge.param)
    end
  end

  private

  def check_finish_tests_by_category?(category)
    return unless category == @test.category.title

    ids = Test.sort_name_category(category).ids
    param_ids_equally_tests_ids?(ids)
  end

  def check_first_try?(_params)
    @user.test_passages.where(test: @test).count == 1
  end

  def check_finish_tests_by_level?(level)
    return unless level.to_i == @test.level

    ids = Test.where(level: level).ids
    param_ids_equally_tests_ids?(ids)
  end

  def param_ids_equally_tests_ids?(ids)
    ids.count == @user.test_passages.where(test_id: ids).success.uniq.count
  end

end
