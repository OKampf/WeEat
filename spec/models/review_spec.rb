require 'rails_helper'

RSpec.describe Review, type: :model do

  describe '#create' do

    context 'create valid review' do
      let(:review) { FactoryGirl.build(:review) }
      it 'has a valid restaurant' do
        expect(review.restaurant).to be_valid
      end
    end

    context 'create a review without a restaurant' do
      let(:review) { FactoryGirl.build(:review, :invalid_restaurant) }
      it 'does not have a valid restaurant' do
        expect(review).to_not be_valid
      end
    end

    context 'create a review with invalid rating' do
      let(:review) { FactoryGirl.build(:review, :invalid_rating) }
      it 'does not have a valid rating' do
        expect(review).to_not be_valid
      end
    end

  end

end

