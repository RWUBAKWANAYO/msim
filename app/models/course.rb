class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 8 }
end
