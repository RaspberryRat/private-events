class Admission < ApplicationRecord
  belongs_to :attendee, class_name: 'User', inverse_of: :admissions
  belongs_to :event_attended, class_name: 'Event', inverse_of: :admissions
end
