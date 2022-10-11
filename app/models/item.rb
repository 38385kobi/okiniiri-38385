class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_date
  belongs_to :user
  has_many_attached :images
  has_one :order
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0, message: "を選択してください"} 
    validates :shipping_fee_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :delivery_date_id, numericality: { other_than: 0, message: "を選択してください"}
    validates :price, format: { with: /\A[0-9]+\z/,allow_blank: true}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,allow_blank: true}
    validates :images
  end
end
