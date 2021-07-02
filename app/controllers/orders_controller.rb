class OrdersController < ApplicationController
  before_action :sold_out_item, only: [:index,:show]
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderShippingAddress.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
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
      @item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def sold_out_item
      redirect_to root_path if item.order.present?
    end
end
