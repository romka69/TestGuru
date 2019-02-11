class Test < ApplicationRecord
  belongs_to :category

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  has_many :questions, dependent: :destroy

  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :timer, numericality: { only_integer: true }

  scope :difficulty, ->(diff) { where(level: diff) }
  scope :easy, -> { difficulty(0..1) }
  scope :middle, -> { difficulty(2..4) }
  scope :hard, -> { difficulty(5..Float::INFINITY) }

  scope :sort_name_category, ->(name) { joins(:category).where(categories: { title: name }).order(title: :desc) }

  def self.list_by_name_category(name)
    sort_name_category(name).pluck(:title)
  end

end
