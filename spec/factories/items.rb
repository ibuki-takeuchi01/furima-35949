FactoryBot.define do
  factory :item do
    product_name          {'test'}
    description           {'test'}
    category_id           {2}
    status_id             {3}
    shipping_charge_id    {2}
    prefecture_id         {15}
    day_to_ship_id        {2}
    price                 {10000}
    user
  end
end