class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :class_id
      t.string :school_id

      t.timestamps
    end
  end
end
