require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
  user = FactoryBot.create(:user)
  item = FactoryBot.create(:item)
    @purchase = FactoryBot.create(:purchase, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  context '購入情報が保存できるとき' do
    it '全ての項目が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end
  end
  context '購入情報が保存できないとき' do
    it 'ユーザーIDが紐付いていなければ保存できないこと' do
      @purchase.user = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('User must exist')
    end
    it 'アイテムIDが紐付いていなければ保存できないこと' do
      @purchase.item = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Item must exist')
    end
  end
end