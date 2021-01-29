require 'rails_helper'

RSpec.describe "/invoices", type: :request do

  describe "GET /show" do
    it "renders a successful invoice response" do
      grade = create(:grade)
      employee = create(:employee, grade: grade)
      timesheet = create(:timesheet, employee: employee, company: "glo")

      # get employee_url(employee), as: :json
      get "/invoices/Glo"
      expect(response).to be_successful

      parse_json = JSON.parse(response.body)
      # Test invoice details
      expect(parse_json.keys).to eq(["company", "total", "items"])
      expect(parse_json["company"]).to eq("glo")

      # Validate total
      total = [timesheet].inject(0) do |sum, ts|
        sum = (ts.billable_hours * ts.unit_price)
      end
      expect(parse_json["total"]).to eq(total)

      # Test invoice items
      invoice_items = parse_json['items']
      expect(invoice_items.length).to eq(1)
      invoice_items.each do |item|
        expect(item.keys)
          .to eq([ 'employee_id', 'employee_name', 'number_of_hours', 'unit_price', 'cost'])
        expect(item['employee_id']).to eq(employee.id)
        expect(item['employee_name']).to eq(employee.name)
        expect(item['number_of_hours']).to eq(timesheet.billable_hours)
        expect(item['unit_price']).to eq(grade.rate)
        expect(item['cost']).to eq(grade.rate * timesheet.billable_hours)
      end
    end
  end
end
