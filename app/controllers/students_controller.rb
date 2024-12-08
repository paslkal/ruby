class StudentsController < ApplicationController
  def create
    @student = Student.create(student_params)
    
    if @student.save
      render json: @student.as_json
    else 
      render json: {message: 'NOT DONE', errors: @student.errors.full_messages}
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
