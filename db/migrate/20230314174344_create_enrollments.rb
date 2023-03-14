class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :event_id, null: false, foreign_key: true, index: { unique: true }
      t.integer :creator_id, null: false, foreign_key: true, index: { unique: true }
      t.string :category

      t.timestamps
    end
  end
end
