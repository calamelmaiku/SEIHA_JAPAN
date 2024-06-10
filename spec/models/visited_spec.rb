require 'rails_helper'

RSpec.describe Visited, type: :model do
  before do
    @visited = FactoryBot.build(:visited)
  end

  describe '訪問記録の作成' do
    context '訪問記録が有効な場合' do
      it 'userとspotとvisitedがあれば登録できる' do
        expect(@visited).to be_valid
      end
    end

    context '訪問記録が無効な場合' do
      it 'userが無ければ登録できない' do
        @visited.user = nil
        expect(@visited).not_to be_valid
      end

      it 'spotが無ければ登録できない' do
        @visited.spot = nil
        expect(@visited).not_to be_valid
      end

      it 'visitedがnilでも登録できる（デフォルト値がある）' do
        @visited.visited = nil
        expect(@visited).to be_valid
      end
    end

    context 'アソシエーションのテスト' do
      it 'ユーザーとの関連付けがある' do
        assoc = described_class.reflect_on_association(:user)
        expect(assoc.macro).to eq :belongs_to
      end

      it 'スポットとの関連付けがある' do
        assoc = described_class.reflect_on_association(:spot)
        expect(assoc.macro).to eq :belongs_to
      end
    end
  end
end
