FactoryBot.define do
  factory :passenger, class: Passenger do
    name { Faker::Movies::HowToTrainYourDragon.character }
    age { Faker::Number.number(digits: 2) }
  end
end
