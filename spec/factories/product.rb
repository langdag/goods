FactoryBot.define do
    factory :product do
      supplier
      sku { Faker::Number.number(digits: 3)}
      name { Faker::Name.first_name }
      price { Faker::Commerce.price }
    end
end