require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ新規作成' do
    context '新規作成できるとき' do
      it 'name、creator、textが存在すれば作成できる' do
        expect(@group).to be_valid
      end
    end

    context '新規作成できないとき' do
      it 'nameが空では作成できない' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end

      it 'creatorが空では作成できない' do
        @group.creator = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Creator can't be blank")
      end

      it 'textが空では作成できない' do
        @group.text = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Text can't be blank")
      end

      it 'nameが重複している場合は作成できない' do
        @group.save
        duplicate_group = @group.dup
        duplicate_group.valid?
        expect(duplicate_group.errors.full_messages).to include("Name has already been taken")
      end
    end
  end
end
