require "rails_helper"

RSpec.describe InvoicesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/invoices/company-name")
        .to route_to("invoices#show", company: "company-name")
    end
  end
end
