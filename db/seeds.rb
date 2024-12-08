school = School.create!(id: 1)

classes_data = [
  { id: 1, number: 10, letter: "A", students_count: 3, students: [
    { first_name: "John", last_name: "Michael", surname: "Doe" },
    { first_name: "Jane", last_name: "Alice", surname: "Smith" },
    { first_name: "Samuel", last_name: "James", surname: "Brown" }
  ]},
  { id: 2, number: 11, letter: "B", students_count: 2, students: [
    { first_name: "Emily", last_name: "Rose", surname: "Davis" },
    { first_name: "Michael", last_name: "David", surname: "Wilson" }
  ]}
]

classes_data.each do |class_data|
  class_group = ClassGroup.create!(
    id: class_data[:id],
    number: class_data[:number],
    letter: class_data[:letter],
    students_count: class_data[:students_count],
    school_id: school.id
  )

  class_data[:students].each do |student_data|
    Student.create!(
      first_name: student_data[:first_name],
      last_name: student_data[:last_name],
      surname: student_data[:surname],
      class_group_id: class_group.id,
      school_id: school.id
    )
  end
end

puts "Data successfully created!"
