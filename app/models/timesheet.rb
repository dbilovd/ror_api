class Timesheet < ApplicationRecord
  # Associations
  belongs_to :employee

  # Validations
  validates :company, :date, :start_time, :end_time, presence: true
  validates_date :date
  validates_time :start_time, before: :end_time
  validates_time :end_time, after: :start_time
end
