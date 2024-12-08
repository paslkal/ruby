class AddSchoolToClassGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :class_groups, :school, null: false, foreign_key: true
  end
end
