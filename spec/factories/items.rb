FactoryBot.define do
  factory :item do
    name { '名前' }
    info { '説明' }
    category_id { 2 }
    sales_status_id { 2 }
    item_shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    item_scheduled_delivery_id { 2 }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
