class BadgeTestService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      get_badge(badge.title) if send("check_#{badge.title}?", badge.rule)
    end
  end

  private

  def check_finish_tests_by_category?(category)
    category_id = Category.find_by(title: category).id
    @user.tests.distinct.where(category: category_id).count == Test.where(category_id: category_id).count
  end

  def check_first_try?(_params)
    @user.tests.where(id: @test.id).count == 1
  end

  def check_finish_tests_by_level?(level)
    @user.tests.distinct.where(level: level).count == Test.where(level: level).count
  end

  def get_badge(title)
    badge = Badge.find_by(title: title)
    user_badge = @user.user_badges.create!(badge: badge)
    user_badge.save
  end

end
