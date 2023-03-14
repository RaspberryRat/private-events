class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :event, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
