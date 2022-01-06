class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :short_name, presence: true, length: { minimum: 2, maximum: 15 },
            uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  has_many :student_courses
  has_many :students, through: :student_courses 
end
