class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  has_many :results
  has_many :users, through: :results

  belongs_to :author, class_name: "User"

  def self.sort_by_name_category(name_category, sort = :desc)
    joins(:category).where(categories: { title: name_category }).order(title: sort).pluck(:title)
  end
end
