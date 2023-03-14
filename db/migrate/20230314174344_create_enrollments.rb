class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :event, null: false, foreign_key: true, index: { unique: true }
      t.integer :creator, null: false, foreign_key: true, index: { unique: true }
      t.string :category

      t.timestamps
    end
  end
end
