school = School.create!(id: 1)

classes_data = [
  { id: 1, number: 10, letter: "A", students_count: 3 },
  { id: 2, number: 11, letter: "B", students_count: 2 }
]

classes_data.each do |class_data|
  class_group = ClassGroup.create!(
    id: class_data[:id],
    number: class_data[:number],
    letter: class_data[:letter],
    school_id: school.id
  )

  class_data[:students_count].times do |i|
    Student.create!(
      class_group_id: class_group.id,
      school_id: school.id
    )
  end
end

puts "Data successfully created!"
