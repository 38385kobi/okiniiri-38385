class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders
  has_many :comments
  
  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/,allow_blank: true}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/,allow_blank: true}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,allow_blank: true}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/,allow_blank: true}
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end
end
