class Review < ApplicationRecord
  belongs_to :restaurant
  validates :reviewer, :rating, :comment, presence: true
  validates :rating, inclusion: 0..3

  after_create :update_restaurant_rating!
  after_update :update_restaurant_rating!
  after_destroy :update_restaurant_rating!

  def update_restaurant_rating!
    rating_count = restaurant.reviews.count
    rating_sum = 0.0
    restaurant.reviews.each { |review|
      rating_sum += review.rating
    }
    restaurant.rating = (rating_sum / rating_count.to_f)
    restaurant.save
  end

end
