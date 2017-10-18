# == Schema Information
#
# Table name: restaurants
#
#  id                :integer          not null, primary key
#  name              :string
#  rating            :decimal(8, 2)
#  accept_10bis      :boolean
#  address           :string
#  max_delivery_time :integer
#  cuisine_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do

  factory :restaurant do
    name FFaker::Company.name
    rating nil
    accept_10bis true
    address FFaker::Address.street_address
    max_delivery_time 30

    association :cuisine, factory: :cuisine

    factory :restaurant_with_reviews do
      transient do
        reviews_count 5
      end

      after(:create) do |restaurant, evaluator|
        FactoryGirl.create_list(:review, evaluator.reviews_count, restaurant: restaurant)
      end
    end

  end

  trait :invalid_max_delivery_time do
    max_delivery_time 0
  end

end
