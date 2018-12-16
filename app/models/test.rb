class Test < ApplicationRecord
  belongs_to :category

  def self.sort_by_name_category(name_category, sort = :desc)
    joins(:category).where(categories: { title: name_category }).order(title: sort).pluck(:title)
  end
end
