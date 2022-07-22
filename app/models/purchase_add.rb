class PurchaseAdd
  include ActiveModel::Model
  attr_accessor :post_code, :shipment_source_id, :municipalities, :address, :building_name, 
               :phone_number, :user_id, :item_id, :token
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :token, presence: true
    validates :user_id, presence: true
    validates :item_id, presence: true
  def save
    # 【学習メモ】購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # 【学習メモ】purchas_idには、変数purchaseのidと指定する
    Add.create(post_code: post_code, shipment_source_id: shipment_source_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end