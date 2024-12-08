class School < ApplicationRecord
  has_many :class_groups, dependent: :destroy
end
