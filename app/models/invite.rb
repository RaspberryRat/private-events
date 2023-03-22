class Invite < ApplicationRecord

  belongs_to :event
  has_many :invitees, foreign_key: :invitee_id
end
