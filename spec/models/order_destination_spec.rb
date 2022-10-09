require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_destination.user_id = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("ユーザーを入力してください")
      end
      it 'item_idが空だと保存できない' do
        @order_destination.item_id = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("商品を入力してください")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_destination.post_code = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_destination.post_code = 1_234_567
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村が空だと保存できないこと' do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空だと保存できないこと' do
        @order_destination.address = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと保存できないこと' do
        @order_destination.phone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_destination.phone_number = '123 - 1234 - 1234'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @order_destination.phone_number = 12_345
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_destination.phone_number = 12_345_678_910_123_111
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "クレジットカード情報が空では登録できないこと" do
        @order_destination.token = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
