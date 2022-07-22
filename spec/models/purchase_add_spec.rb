require 'rails_helper'

RSpec.describe PurchaseAdd, type: :model do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
  #purchase = FactoryBot.create(:purchase)
  @purchase_add = FactoryBot.build(:purchase_add, user_id: user.id, item_id: item.id)
  end
  context '購入できるとき' do
    it '全ての項目が正しく入力されていれば保存できること' do
      expect(@purchase_add).to be_valid
    end
    it '建物名が存在しなくても購入できること' do
      @purchase_add.building_name = ""
      expect(@purchase_add).to be_valid
    end
  end
  context '購入できないとき' do
    it '郵便番号がない場合は保存できないこと' do
      @purchase_add.post_code = ''
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンがない場合は保存できないこと' do
      @purchase_add.post_code = '1234567'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '郵便番号が半角数字でないと保存できないこと' do
      @purchase_add.post_code = '１２３４５６７'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '「都道府県」未選択の場合は保存できないこと' do
      @purchase_add.shipment_source_id = '1'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Shipment source can't be blank")
    end
    it '「市区町村」未入力の場合は保存できないこと' do
      @purchase_add.municipalities = ''
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '「番地」未入力の場合は保存できないこと' do
      @purchase_add.address = ''
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Address can't be blank")
    end
    it '「電話番号」未入力の場合は保存できないこと' do
      @purchase_add.phone_number = ''
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがある場合は保存できないこと' do
      @purchase_add.phone_number = '090-1234-5678'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が９桁以下の場合は保存できないこと' do
      @purchase_add.phone_number = '090123456'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号１２桁以上の場合は保存できないこと' do
      @purchase_add.phone_number = '090123456789'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が半角数字でないと出品できないこと' do
      @purchase_add.phone_number = '３００'
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が半角英数混合では登録できないこと" do
      @purchase_add.phone_number = "phonenumber09012345678"
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が半角英語では登録できないこと" do
      @purchase_add.phone_number = "phonenumber"
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Phone number is invalid")
    end
    it 'ユーザーIDが紐付いていなければ購入できないこと' do
      @purchase_add.user_id = nil
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("User can't be blank")
    end
    it 'アイテムIDが紐付いていなければ購入できないこと' do
      @purchase_add.item_id = nil
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Item can't be blank")
    end
    it 'トークンが空だと購入できないこと' do
      @purchase_add.token = nil
      @purchase_add.valid?
      expect(@purchase_add.errors.full_messages).to include("Token can't be blank")
    end
  end
end