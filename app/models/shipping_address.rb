class ShippingAddress < ApplicationRecord

  with_options presence: true do
    validates :postal_code, format: { with: \A\d{3}[-]?\d{4}\z}
    validates :prefecture_id
    validates :city_name
    validates :address
    validates :phone_number
    end

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1 }
end
