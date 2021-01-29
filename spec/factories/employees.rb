require 'faker'

FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    grade { build(:grade) }
  end
end
