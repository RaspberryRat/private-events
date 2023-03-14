class Enrollment < ApplicationRecord
  belongs_to :event, inverse_of: :enrollments
  belongs_to :creator, class_name: 'User', inverse_of: :enrollments
end
