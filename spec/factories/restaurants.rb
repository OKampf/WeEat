FactoryGirl.define do
  factory :restaurant do
    id 1
    name 'Restaurant Name 1'
    rating 2
    accept_10bis true
    address 'Restaurant Address 1'
    max_delivery_time 30
    cuisine {create(:cuisine)}
  end

  trait :invalid_max_delivery_time do
    max_delivery_time 0
  end

  trait :invalid_cuisine do
    cuisine {}
  end

end
