FactoryBot.define do
  factory :purchase_add do
    post_code { '123-4567' }
    shipment_source_id { '2' }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル101' }
    phone_number { '09012345678' }
    token { 'aaaa' }
  end
end


# ・郵便番号
# ・都道府県
# ・市区町村
# ・番地
# ・建物名
# ・電話番号
# ・token