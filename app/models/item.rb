class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :shipment_source
  has_one_attached :image

  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :explanation, presence: true  
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
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipment_source_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
end
