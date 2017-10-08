require 'rails_helper'

RSpec.describe Review, type: :model do

  describe '#create' do

    context 'create valid review' do
      let(:review) { FactoryGirl.create(:review) }
      it 'has a valid restaurant' do
        expect(review.restaurant).to be_valid
      end
    end

    context 'create a review with invalid rating' do
      let(:review) { FactoryGirl.build(:review, :invalid_rating) }
      it 'does not have a valid rating' do
        expect(review).to_not be_valid
      end
    end

  end

  describe '#update_restaurant_rating!' do
    let(:restaurant_with_reviews) { FactoryGirl.create(:restaurant_with_reviews) }

    it 'restaurant rating should valid' do

      rating_sum = restaurant_with_reviews.reviews.map(&:rating).sum
      rating_count = restaurant_with_reviews.reviews.count.to_f

      avg_ratings = rating_sum / rating_count
      expect(restaurant_with_reviews.rating).to eq(avg_ratings)

    end

  end

end