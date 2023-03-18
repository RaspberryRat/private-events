class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :admissions, foreign_key: :event_attended_id
  has_many :attendees, through: :admissions

  def self.past
    self.where("date < ?", Time.now)
  end

  def self.future
    self.where("date > ?", Time.now)
  end
end
