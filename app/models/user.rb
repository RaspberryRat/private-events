class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: true, length: { in: 3..15 }

  has_many :events, foreign_key: 'creator_id'

  has_many :admissions, foreign_key: :attendee_id
  has_many :event_vists, through: :admissions, source: :event_attended
end
