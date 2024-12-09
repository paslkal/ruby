require 'digest'

class StudentsController < ApplicationController
  def index
    school = School.find(params[:school_id])
  
    school_class = school.class_groups.find(params[:class_id])
  
    students = school_class.students
    render json: students
  end
  
  
  def create
    school = School.find_or_create_by(id: params[:school_id])

    school_class = school.class_groups.find_or_create_by(id: params[:class_id]) do |cg|
      cg.number = params[:class_number] 
      cg.letter = params[:class_letter]
    end

    @student = school_class.students.create(student_params.merge(class_group_id: school_class.id, school_id: school.id))

    if @student.save
      user_id = @student.id
      secret_salt = 'paslkal'
      token = generate_token(user_id, secret_salt)

      render json: { student: @student.as_json, auth_token: token }, status: :created
    else
      render json: { message: 'Invalid Input', errors: @student.errors.full_messages }, status: :method_not_allowed
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
  
    if @student
      @student.destroy
      render json: { message: 'Student successfully deleted' }
    else
      render json: { message: 'Некорректный id студента' }, status: :bad_request
    end
  end
  

  private 

  def generate_token(user_id, secret_salt)
    Digest::SHA256.hexdigest("#{user_id}#{secret_salt}")
  end

  def student_params
    params.permit(
      :first_name, 
      :last_name,
      :surname,
      :class_group_id,
      :school_id
    )
  end
end
