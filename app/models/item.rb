class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0, message: "を選択してください"} 
    validates :shipping_fee_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :delivery_date_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :price, format: { with: /\A[0-9]+\z/,allow_blank: true}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,allow_blank: true}
    validates :image
  end
end
