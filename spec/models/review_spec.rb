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
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    let(:review1) { FactoryGirl.create(:review, restaurant: restaurant) }
    let(:review2) { FactoryGirl.create(:review, restaurant: restaurant) }

    it 'restaurant rating should valid' do
      avg_ratings = ( review1.rating + review2.rating ) / 2.0
      expect(restaurant.rating).to eq(avg_ratings)

    end

  end

end