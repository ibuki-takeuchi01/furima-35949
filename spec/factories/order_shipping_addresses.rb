
FactoryBot.define do
  factory :order_shipping_address do
    token                 {'aaa'}
    postal_code           {'000-1111'}
    prefecture_id         {'15'}
    city_name             {'長野'}
    address               {'長野市'}
    building_name         {'ビル'}
    phone_number          {'00011112222'}
    user
    item
  end
end
