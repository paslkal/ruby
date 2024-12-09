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
      cg.students_count = 1 
    end

    @student = school_class.students.create(student_params.merge(class_group_id: school_class.id, school_id: school.id))

    if @student.save
      user_id = @student.id
      secret_salt = 'paslkal'
      token = generate_token(user_id, secret_salt)
      response.headers['X-Auth-Token'] = token
      render json: @student.as_json, status: :created
    else
      render json: { message: 'Invalid Input', errors: @student.errors.full_messages }, status: :method_not_allowed
    end
  end

  def destroy
    auth_token = request.headers['X-Auth-Token']

    puts auth_token

    unless valid_token?(auth_token)
      return render json: { message: 'Некорректная авторизация' }, status: :unauthorized
    end

    @student = Student.find_by(id: params[:id])

    if @student
      @student.destroy
      render json: { message: 'Student successfully deleted' }
    else
      render json: { message: 'Некорректный id студента' }, status: :bad_request
    end
  end  

  private 

  def valid_token?(auth_token)
    return false if auth_token.blank?

    user_id = params[:id]
    secret_salt = 'paslkal' 
    expected_token = generate_token(user_id, secret_salt)

    auth_token == expected_token
  end

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
