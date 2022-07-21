class Add < ApplicationRecord
  belongs_to :purchase
  
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
end