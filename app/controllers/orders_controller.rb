class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index,:create,:pay_item]
  
  def index
    @order_address = OrderShippingAddress.new
      if current_user == @item.user
      redirect_to root_path
      end
      redirect_to root_path if @item.order.present?
  end

  def create
    @order_address = OrderShippingAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
  end
end

  private
    def order_params
      params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

end
