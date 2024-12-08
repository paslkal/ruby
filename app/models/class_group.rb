class ClassGroup < ApplicationRecord
  attr_readonly :id
  belongs_to :school
  has_many :studentsend
end