require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordに英数字両方あれば登録できる' do
      expect(@user).to be_valid
    end
  end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passworgが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが英数字両方なければ登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid','Password confirmation is invalid')
    end
    it 'last_nameが全角（漢字、かな、カナ）でなければ登録できない' do
    @user.last_name = "aiueo"
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameが全角（漢字、かな、カナ）でなければ登録できない' do
    @user.first_name = "aiueo"
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaが全角カタカナでなければ登録できない' do
    @user.last_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'first_name_kanaが全角カタカナでなければ登録できない' do
    @user.first_name_kana = "あいうえお"
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    end
  end
end
