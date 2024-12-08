class Student < ApplicationRecord
  attr_readonly :id
  belongs_to :class_group
end
