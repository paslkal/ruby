class Student < ApplicationRecord
  attr_readonly :id
  belongs_to :class_group

  def as_json(options = {})
    super(options).tap do |hash|
      hash['class_id'] = hash.delete('class_group_id')
      hash['school_id'] = school_id.to_i 
    end
  end
end
