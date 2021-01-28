class Grade < ApplicationRecord

	# Validations
	validates :title, presence: true
	validates :rate, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
