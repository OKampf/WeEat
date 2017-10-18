# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  reviewer      :string
#  rating        :integer
#  comment       :text
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

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
