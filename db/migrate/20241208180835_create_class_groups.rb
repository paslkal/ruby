class CreateClassGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :class_groups do |t|
      t.integer :number, limit: 4
      t.string :letter
      t.integer :students_count, limit: 4

      t.timestamps
    end
  end
end
