class ClassGroupsController < ApplicationController
  def create 
    @class_group = ClassGroup.create(class_group_params)

    if @class_group.save 
      render json: @class_group.as_json
    else 
      render json: {message: 'NOT DONE', errors: @class_group.errors.full_messages}
    end 
  end

  private

  def class_group_params
    params.permit(
      :number,
      :letter,
      :students_count
    )
  end
end
