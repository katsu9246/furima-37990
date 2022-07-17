FactoryBot.define do
  factory :item do
    item_name { '風けイｶﾞZu' }
    category_id { '2' }
    explanation { 'この風けイｶﾞZuは、Brownさんが撮影したものです（仮）。金額は¥100,000.-です。' }
    situation_id { '2' }
    delivery_charge_id { '2' }
    shipment_source_id { '2' }
    days_to_ship_id { '2' }
    price { '5000000' }

    association :user
    after(:create) do |item|
      item.image.attach(io: File.open('public/images/timage.png'), filename: 'timage.png')
    end
  end
end