require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品登録ができる時" do
      it "全ての情報が正しく入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品登録ができない時" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
    end
    it "nameが空だと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it "descriptionが空だと出品できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it "category_idが0以外でないと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it "shipping_fee_idが0以外でないと出品できない" do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
    it "prefecture_idが0以外でないと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it "delivery_date_idが0以外でないと出品できない" do
      @item.delivery_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it "priceが空だと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it "priceが300未満だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
    end
    it "priceが10000000以上だと出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
    end
    it "priceが全角数字では出品できない" do
      @item.price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
    it "priceが半角英字では出品できない" do
      @item.price = "sample"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
    it "priceが半角英数字混合では出品できない" do
      @item.price = "sample1000"
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
    it "userが紐付いていないと出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
  end
end
