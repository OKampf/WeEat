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

class Review < ApplicationRecord
  belongs_to :restaurant
  validates :reviewer, :rating, :comment, presence: true
  validates :rating, inclusion: 0..3

  after_create :update_restaurant_rating!
  after_update :update_restaurant_rating!
  after_destroy :update_restaurant_rating!

  def update_restaurant_rating!
    rating_count = restaurant.reviews.count.to_f
    # rating_sum = restaurant.reviews.reduce(0) { |sum, element| sum + element.rating }
    rating_sum = restaurant.reviews.map(&:rating).sum
    restaurant.rating = (rating_sum / rating_count)
    restaurant.save
  end

end
