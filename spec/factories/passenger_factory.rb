FactoryBot.define do
  factory :passenger, class: Passenger do
    name { Faker::Name.name }
    age { Faker::Number.number(digits: 2) }
  end
end
