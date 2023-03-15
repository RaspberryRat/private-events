class CreateAdmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :admissions do |t|


      t.timestamps
    end

    add_reference :admissions, :attendee
    add_reference :admissions, :event_attended
  end
end
