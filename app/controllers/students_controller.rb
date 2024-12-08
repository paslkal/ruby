class StudentsController < ApplicationController
  def index
    school = School.find(params[:school_id])
    return render json: { message: 'School not found' }, status: :not_found if school.nil?
  
    school_class = school.class_groups.find_by(id: params[:class_id])
    return render json: { message: 'Class not found' }, status: :not_found if school_class.nil?
  
    students = school_class.students
    render json: students
  end
  
  
  def create
    @student = Student.create(student_params)
    
    if @student.save
      render json: @student.as_json
    else 
      render json: {message: 'NOT DONE', errors: @student.errors.full_messages}
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
  
    if @student
      @student.destroy
      render json: { message: 'Student successfully deleted' }
    else
      render json: { message: 'Student not found' }, status: :not_found
    end
  end
  

  private 

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
