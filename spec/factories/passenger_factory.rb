FactoryBot.define do
  factory :passenger, class: Passenger do
    name { Faker::Name.unique.name }
    age { Faker::Number.number(digits: 2) }
  end
end
