require 'faker'

FactoryBot.define do
  factory :timesheet do
    employee { build(:employee) }
    company { Faker::Company.name }
    date { Faker::Date.in_date_period(month: 1).strftime("%Y-%m-%d") }
    start_time { Faker::Time.backward(period: :morning) }
    end_time { Faker::Time.forward(period: :afternoon) }
  end
end
