class RemoveEventIdAndCreatorIdFromEnrollments < ActiveRecord::Migration[7.0]
  def change
    change_table :enrollments do |e|
      e.remove :creator_id, :event_id
    end

  end
end
