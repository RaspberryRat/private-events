class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :admissions, foreign_key: :event_attended_id
  has_many :attendees, through: :admissions
end
