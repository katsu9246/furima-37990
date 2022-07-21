require 'rails_helper'

RSpec.describe Add, type: :model do
  before do
    purchase = FactoryBot.create(:purchase)
    @add = FactoryBot.create(:add, purchase_id: purchase.id)
    sleep(1)
  end
  context '保存できるとき' do
    it '全ての項目が正しく入力されていれば保存できること' do
      expect(@add).to be_valid
    end
  end
  context '保存できないとき' do
    it '購買情報が紐付いていなければ保存できないこと' do
      @add.purchase = nil
      @add.valid?
      expect(@add.errors.full_messages).to include('Purchase must exist')
    end
    it '郵便番号がない場合は保存できないこと' do
      @add.post_code = ''
      @add.valid?
      expect(@add.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンがない場合は保存できないこと' do
      @add.post_code = '1234567'
      @add.valid?
      expect(@add.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '郵便番号が半角数字でないと保存できないこと' do
      @add.post_code = '１２３４５６７'
      @add.valid?
      expect(@add.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '「都道府県」未選択の場合は保存できないこと' do
      @add.shipment_source_id = '1'
      @add.valid?
      expect(@add.errors.full_messages).to include("Shipment source can't be blank")
    end
    it '「市区町村」未入力の場合は保存できないこと' do
      @add.municipalities = ''
      @add.valid?
      expect(@add.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '「番地」未入力の場合は保存できないこと' do
      @add.address = ''
      @add.valid?
      expect(@add.errors.full_messages).to include("Address can't be blank")
    end
    it '「電話番号」未入力の場合は保存できないこと' do
      @add.phone_number = ''
      @add.valid?
      expect(@add.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にハイフンがある場合は保存できないこと' do
      @add.phone_number = '090-1234-5678'
      @add.valid?
      expect(@add.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が半角数字でないと出品できないこと' do
      @add.phone_number = '３００'
      @add.valid?
      expect(@add.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が半角英数混合では登録できないこと" do
      @add.phone_number = "phonenumber09012345678"
      @add.valid?
      expect(@add.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が半角英語では登録できないこと" do
      @add.phone_number = "phonenumber"
      @add.valid?
      expect(@add.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

