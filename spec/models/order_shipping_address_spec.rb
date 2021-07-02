
require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
    @item.save
    # binding.pry
    @order_address = FactoryBot.build(:order_shipping_address,user_id: @user.id,item_id: @item.id)
    sleep 0.1
end

describe '商品の購入機能' do
  context '商品の購入できるとき' do
  it '全ての項目が存在すれば登録できる' do
    expect(@order_address).to be_valid
  end
  it 'building_nameは空でも登録できる' do
    @order_address.building_name = ''
    expect(@order_address).to be_valid
  end
end
  context '商品の購入ができないとき' do
  it 'tokenが空では登録できない' do
    @order_address.token = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  it 'postal_codeが空では登録できない' do
    @order_address.postal_code = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeに-(ハイフン)が無ければ登録できない' do
    @order_address.postal_code = '1112222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end
  it 'postal_codeが"数字3桁-4桁"で無ければ登録できない' do
    @order_address.postal_code = '111-222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end
  it 'postal_codeが全角数字であれば登録できない' do
    @order_address.postal_code = '１１１−２２２'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end
  it 'prefecture_idが"1(--)"では登録できない' do
    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it 'city_nameが空では登録できない' do
    @order_address.city_name = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City name can't be blank")
  end
  it 'addressが空では登録できない' do
    @order_address.address = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'phone_numberが空では登録できない' do
    @order_address.phone_number = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberに-(ハイフン)があれば登録できない' do
    @order_address.phone_number = '000-1111-2222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが9桁以下では登録できない' do
    @order_address.phone_number = '000111222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが12桁以上では登録できない' do
    @order_address.phone_number = '000011112222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが半角英字では登録できない' do
    @order_address.phone_number = 'aaabbbbcccc'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが全角数字では登録できない' do
    @order_address.phone_number = '０００１１１１２２２２'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  it 'phone_numberが半角英数字が混合では登録できない' do
    @order_address.phone_number = '0000aaaa2222'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end
  end
end
end

