class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :admissions, foreign_key: :event_attended_id
  has_many :attendees, through: :admissions

  has_many :invites
  has_many :invitees, through: :invites

  scope :past, -> { where("date < ?", Time.now)}
  scope :future, -> { where("date > ?", Time.now)}
  # def self.past
  #   self.where("date < ?", Time.now)
  # end

  # def self.future
  #   self.where("date > ?", Time.now)
  # end
end
