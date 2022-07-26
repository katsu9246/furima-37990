class PurchaseAdd
  include ActiveModel::Model
  attr_accessor :post_code, :shipment_source_id, :municipalities, :address, :building_name, 
               :phone_number, :user_id, :item_id, :token
    with_options presence: true do
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "には「-」を入れてください"}
      validates :shipment_source_id, numericality: { other_than: 1, message: "を選択してください" }
      validates :municipalities
      validates :address
      validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は半角数字（ハイフンなし）で入力してください" }
      validates :token
      validates :user_id
      validates :item_id
    end
  def save
    # 【学習メモ】購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # 【学習メモ】purchas_idには、変数purchaseのidと指定する
    Add.create(post_code: post_code, shipment_source_id: shipment_source_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end