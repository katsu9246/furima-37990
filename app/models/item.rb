class Item < ApplicationRecord
  belongs_to :user
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
end
