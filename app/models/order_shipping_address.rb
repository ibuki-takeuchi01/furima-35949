class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
  validates :token
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city_name
  validates :address
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number,order_id: order.id)
  end
end