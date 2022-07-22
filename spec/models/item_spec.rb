require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '出品ができるとき' do
    it '全ての項目の入力が存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end
  context '出品ができないとき' do
    it 'ユーザーが紐付いていなければ投稿できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    it '商品名がない場合は出品できないこと' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品名が４０文字を超える場合は出品できないこと' do
        @item.item_name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name must be less than or equal to 40")
    end
    it '商品の説明がない場合は出品できないこと' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it '商品の説明が1,000文字を超える場合は出品できないこと' do
      @item.explanation = 'あ' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation must be less than or equal to 1_000")
    end
    it '「カテゴリー」未選択の場合は出品できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '「商品の状態」未選択の場合は出品できないこと' do
      @item.situation_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end
    it '「配送料の負担」未選択の場合は出品できないこと' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it '「発送元の地域」未選択の場合は出品できないこと' do
      @item.shipment_source_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source can't be blank")
    end
    it '「発送までの日数」未選択の場合は出品できないこと' do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it '「販売価格」がない場合は出品できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数字でないと出品できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
    end
    it "priceが半角英数混合では登録できないこと" do
      @item.price = "300dollars"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
    end
    it "priceが半角英語だけでは登録できないこと" do
      @item.price = "threemillion"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
    end
    it '販売価格が300円未満の場合は出品できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '販売価格が１千万円以上の場合は出品できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
