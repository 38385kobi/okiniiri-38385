FactoryBot.define do
  factory :item do
    name {"コップ"}
    description {"保冷・保温可能"}
    category_id {1}
    shipping_fee_id {1}
    prefecture_id {1}
    delivery_date_id {1}
    price {2000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end