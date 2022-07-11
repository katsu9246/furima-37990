require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot,build(:user)
  end
  context 'ユーザー新規登録及びログインができるとき' do 
    it "全ての項目の入力が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "passwordが6文字以上半角英数字混合であればユーザー新規登録及びログインできること" do
      user = build(:user, password: "12345a", encrypted_password: "12345a")
      expect(user).to be_valid
    end
  end
  context 'ユーザー新規登録及びログインができないとき' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
    end
    it "emailがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "last_nameがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "last_name_kanaがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "first_nameがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "first_name_kanaがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "birthdayがない場合はユーザー新規登録及びログインできないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    it "passwordが5文字以下であればユーザー新規登録及びログインできないこと" do
      user = build(:user, password: "1234a")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    it "passwordが半角数字のみであればユーザー新規登録及びログインできないこと" do
      user = build(:user, password: "123456")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    it "passwordが半角英字のみであればユーザー新規登録及びログインできないこと" do
      user = build(:user, password: "abcdef")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    it "passwordが全角であればユーザー新規登録及びログインできないこと" do
      user = build(:user, password: "A")
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    it "重複したemailが存在する場合ユーザー新規登録及びログインできないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it 'last_nameが全角入力でなければユーザー新規登録及びログインできないこと' do
      user = build(:user, last_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end
    it 'first_nameが全角入力でなければユーザー新規登録及びログインできないこと' do
      user = build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it 'last_name_kanaが全角カタカナでなければユーザー新規登録及びログインできないこと' do
      user = build(:user, last_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end
    it 'first_name_kanaが全角カタカナでなければユーザー新規登録及びログインできないこと' do
      user = build(:user, first_name_kana: "あいうえお")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
  end
end