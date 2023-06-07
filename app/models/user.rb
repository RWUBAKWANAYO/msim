class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :enrollments
  has_many :courses, through: :enrollments


    def get_user_enrollments
    enrollments.includes(:course)
  end
end
