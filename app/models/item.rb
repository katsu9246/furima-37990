class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :Category
  belongs_to :Situation
  belongs_to :Delivery_charge
  belongs_to :Shipment_source
  has_one_attached :image
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                      presence: { message: "can't be blank" }
  end

  validates :item_name, presence: true, length: { maximum: 40, message: "must be less than or equal to 40" }
  validates :category_id, presence: true
  validates :explanation, presence: true, length: { maximum: 1000, message: "must be less than or equal to 1_000" }
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipment_source_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipment_source_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
end
