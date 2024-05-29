require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe 'スポット新規作成' do
    context '新規作成できるとき' do
      it 'name、text、address、latitude、longitudeが存在すれば作成できる' do
        expect(@spot).to be_valid
      end
    end

    context '新規作成できないとき' do
      it 'nameが空では作成できない' do
        @spot.name = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Name can't be blank")
      end

      it 'textが空では作成できない' do
        @spot.text = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Text can't be blank")
      end

      it 'addressが空では作成できない' do
        @spot.address = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Address can't be blank")
      end

      it 'latitudeが空では作成できない' do
        @spot.latitude = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Latitude can't be blank")
      end

      it 'latitudeが数値でなければ作成できない' do
        @spot.latitude = 'invalid'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Latitude is not a number")
      end

      it 'longitudeが空では作成できない' do
        @spot.longitude = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Longitude can't be blank")
      end

      it 'longitudeが数値でなければ作成できない' do
        @spot.longitude = 'invalid'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Longitude is not a number")
      end
    end
  end
end
