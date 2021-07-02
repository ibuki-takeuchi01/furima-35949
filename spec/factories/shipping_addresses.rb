FactoryBot.define do
  factory :shipping_address do
    postal_code           {'000-1111'}
    prefecture_id         {15}
    city_name             {2}
    address               {3}
    phone_number          {000000000}
    user
    item
  end
end
