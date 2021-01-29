class Invoice
	# Constructor
	def initialize(company_name)
		@company_name = company_name.downcase
		@timesheets = Timesheet.where(company: @company_name)
      .order(created_at: :asc)
      .all
	end

	def prepared_timesheets
    @timesheets.map do |timesheet| 
    	timesheet.prepared_for_invoice
		end
	end

	def total_cost
		@timesheets.inject(0) { |sum, sheet| sum += sheet.cost}
	end

	def response
  	response = {
  		"company": @company_name,
  		"total": self.total_cost,
  		"items": self.prepared_timesheets
  	}
	end
end