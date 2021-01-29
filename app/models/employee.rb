class Employee < ApplicationRecord
  belongs_to :grade

  # Validation
  validates :name, presence: true
  # validates :grade, presence: true
end
