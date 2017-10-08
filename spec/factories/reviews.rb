
require 'FFaker'

FactoryGirl.define do

  factory :review do
    id 1
    reviewer FFaker::Name.name
    rating 1
    comment 'Comment 1'
    restaurant {create(:restaurant)}
  end

  trait :invalid_rating do
    rating 4
  end

  trait :invalid_restaurant do
    restaurant {}
  end

end