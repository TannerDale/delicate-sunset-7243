FactoryBot.define do
  factory :flight, class: Flight do
    association :airline
    number { Faker::Number.number(digits: 5) }
    date { Faker::Date.forward(days: 1) }
    departure_city { Faker::Address.city }
    arrival_city { Faker::Address.city }
  end
end
