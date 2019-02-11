class Badge < ApplicationRecord

  IMG_FORMAT = /\.(svg|jpg|png|gif)\z/i.freeze
  BADGE_RULES = %w[finish_tests_by_category first_try finish_tests_by_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :file, :rule, presence: true
  validates :file, format: IMG_FORMAT

end
