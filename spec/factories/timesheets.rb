FactoryBot.define do
  factory :timesheet do
    employee { build(:employee) }
    company { "MyString" }
    date { "2021-01-29" }
    start_time { "2021-01-29 08:13:43" }
    end_time { "2021-01-29 09:13:43" }
  end
end
