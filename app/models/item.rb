class Item < ApplicationRecord

  with_options presence: true do
  validates :product_name
  validates :description
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :day_to_ship_id
  validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_charege_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 }
end
