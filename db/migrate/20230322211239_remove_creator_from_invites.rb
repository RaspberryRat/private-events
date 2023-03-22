class RemoveCreatorFromInvites < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:invites, :creator)
  end
end
