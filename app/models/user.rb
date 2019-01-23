class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  VALID_EMAIL = /\A\w+@\w+\.\w+\z/.freeze

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :created_tests, class_name: "Test", foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
