class Item < ApplicationRecord

  with_options presence: true do
  validates :image
  validates :product_name,length: { maximum: 40 }
  validates :description,length: { maximum: 1000 }
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :day_to_ship_id
  validates :price, inclusion: { in: 300..9999999 }
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
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :day_to_ship_id
  end
end
