class StudentsController < ApplicationController
  def create
    render json: {
      message: "Done"
    }
  end

  private 

  def student_params
    params.require(:student).permit(
      :first_name, 
      :last_name,
      :surname,
      :class_id,
      :school_id
    )
  end
end
