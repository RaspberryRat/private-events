class AddReferencesToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :event
    add_reference :enrollments, :creator
  end
end
