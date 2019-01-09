class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.references :application, foreign_key: true
      t.references :workshop, foreign_key: true

      t.timestamps
    end
  end
end
