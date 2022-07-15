require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録及びログインができるとき' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上半角英数字混合であればユーザー新規登録及びログインできること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
  end
  context 'ユーザー新規登録及びログインができないとき' do
    it 'nicknameがない場合は登録できないこと' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailがない場合はユーザー新規登録及びログインできないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordがない場合はユーザー新規登録及びログインできないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid',
                                                    "Password confirmation doesn't match Password")
    end
    it 'last_nameがない場合はユーザー新規登録及びログインできないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end
    it 'last_name_kanaがない場合はユーザー新規登録及びログインできないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
    end
    it 'first_nameがない場合はユーザー新規登録及びログインできないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end
    it 'first_name_kanaがない場合はユーザー新規登録及びログインできないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end
    it 'birthdayがない場合はユーザー新規登録及びログインできないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'パスワードと確認用パスワードが不一致だと登録できないこと' do
      @user.password = '12345a'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下であればユーザー新規登録及びログインできないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角数字のみであればユーザー新規登録及びログインできないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが半角英字のみであればユーザー新規登録及びログインできないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが全角であればユーザー新規登録及びログインできないこと' do
      @user.password = 'ABCDEF'
      @user.password_confirmation = 'ABCDEF'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合ユーザー新規登録及びログインできないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'last_nameが全角入力でなければユーザー新規登録及びログインできないこと' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameが全角入力でなければユーザー新規登録及びログインできないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaが全角カタカナでなければユーザー新規登録及びログインできないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'first_name_kanaが全角カタカナでなければユーザー新規登録及びログインできないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
