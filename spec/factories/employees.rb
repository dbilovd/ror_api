FactoryBot.define do
  factory :employee do
    name { "MyString" }
    grade { build(:grade) }
  end
end
