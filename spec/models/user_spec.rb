require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空では登録できない' do
      @user.name = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = 'different_password'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      expect(another_user).not_to be_valid
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testemail.com'
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a' * 5
      @user.password_confirmation = 'a' * 5
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = 'a' * 129
      @user.password_confirmation = 'a' * 129
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
  end
end
