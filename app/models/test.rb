class Test < ApplicationRecord
  belongs_to :category

  def self.list_tests_in_category(name_category, sort = :desc)
    joins(:category).where(categories: { title: name_category }).order(title: sort).pluck(:title)
  end
end
