FactoryBot.define do
  factory :add do
    post_code { '123-4567' }
    shipment_source_id { '2' }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル101' }
    phone_number { '09012345678' }
  end
end
