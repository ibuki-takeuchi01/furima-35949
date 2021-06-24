require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
  end

  describe '商品の出品機能' do
    context '商品の出品できるとき' do
    it '全ての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
    context '商品の出品できないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが"1(--)"では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'status_idが"1(--)"では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'shipping_charge_idが"1(--)"では登録できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it 'prefecture_idが"1(--)"では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'day_to_ship_idが"1(--)"では登録できない' do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
    end
    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299以下では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが10,000,000以上では登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが全角では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角英数の混合では登録できない' do
      @item.price = '12ooo'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角英語では登録できない' do
      @item.price = 'loooq'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    end
  end
end
