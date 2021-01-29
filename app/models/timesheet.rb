class Timesheet < ApplicationRecord
  # Associations
  belongs_to :employee

  # Validations
  validates :company, :date, :start_time, :end_time, presence: true
  validates_date :date
  validates_time :start_time, before: :end_time
  validates_time :end_time, after: :start_time

  def billable_hours
  	TimeDifference.between(self.start_time, self.end_time).in_hours
  end

  def unit_price
  	self.employee.grade.rate
  end

  def cost
  	self.billable_hours * self.unit_price
  end

  def prepared_for_invoice
		{
			employee_id: self.employee[:id],
			employee_name: self.employee[:name],
			number_of_hours: self.billable_hours,
			unit_price: self.unit_price,
			cost: self.cost,
		}
  end
end
