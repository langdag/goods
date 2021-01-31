FactoryBot.define do
    factory :supplier do
      code { Faker::Number.number(digits: 4) }
      name { Faker::Name.first_name }
    end
end