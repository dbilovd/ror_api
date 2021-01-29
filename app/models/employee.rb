class Employee < ApplicationRecord
  belongs_to :grade
  has_many :timesheets

  # Validation
  validates :name, presence: true
  # validates :grade, presence: true
  
  # Before Create Hook
  before_create do |employee|
  	employee.api_key = employee.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Employee.exists?(api_key: token)
    end
  end
end
