class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,        null: false 
      t.integer :prefecture_id ,    null: false 
      t.string :city_name,          null: false
      t.string :address,            null: false
      t.string :building_name,      null: false
      t.integer :phone_number,      null: false
      t.timestamps
    end
  end
end
