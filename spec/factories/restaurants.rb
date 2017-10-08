FactoryGirl.define do
  factory :restaurant do
    name FFaker::Company.name
    rating nil
    accept_10bis true
    address FFaker::Address.street_address
    max_delivery_time 30

    association :cuisine, factory: :cuisine
  end

  trait :invalid_max_delivery_time do
    max_delivery_time 0
  end

end
