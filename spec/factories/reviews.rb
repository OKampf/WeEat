FactoryGirl.define do

  factory :review do
    reviewer { FFaker::Name.name }
    rating { rand(0..3) }
    comment FFaker::Lorem.sentence

    association :restaurant, factory: :restaurant
  end

  trait :invalid_rating do
    rating 4
  end

end