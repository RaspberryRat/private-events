class Event < ApplicationRecord
  has_many :enrollments
  has_many :creators, through: :enrollments
end
