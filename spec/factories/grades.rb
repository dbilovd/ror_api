require 'faker'

FactoryBot.define do
  factory :grade do
    title { Faker::Name.name }
    # Rate is stored in pesewas
    rate { (Faker::Commerce.price * 100).to_i } 
  end
end
