require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  describe '#create' do

    context 'create valid restaurant' do
      let(:restaurant) { FactoryGirl.create(:restaurant) }
      it 'has a valid cuisine' do
        expect(restaurant).to be_valid
      end
    end

    context 'create a restaurant with invalid max_delivery_time' do
      let(:restaurant) { FactoryGirl.build(:restaurant, :invalid_max_delivery_time) }
      it 'does not have a valid max_delivery_time' do
        expect(restaurant).to_not be_valid
      end
    end

  end

end