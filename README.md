# テーブル設計

 ## users テーブル

 | Column              | Type   | Options     |
 | ------------------- | ------ | ----------- |
 | email               | string | null: false |
 | encrypted_password  | string | null: false |
 | nickname            | string | null: false |
 | name                | text   | null: false |
 | name_kana           | text   | null: false |
 | birthday_date       | text   | null: false |

 ### Association
- has_many :items
- has_many :orders

 ## items テーブル

 | Column            | Type       | Options                        |
 | ----------------- | ---------- | ------------------------------ |
 | image             |            | ActiveStorage                  |
 | product_name      | string     | null: false                    |
 | description       | text       | null: false                    |
 | category          | string     | null: false                    |
 | status            | string     | null: false                    |
 | shipping_charges  | string     | null: false                    |
 | days_to_ship      | string     | null: false                    |
 | price             | integer    | null: false                    |
 | user              | references | null: false, foreign_key: true |

  ### Association
- belongs_to :user
- has_one :orders

 ## orders テーブル

 | Column            | Type       | Options                        |
 | ----------------- | ---------- | ------------------------------ |
 | shipping_address  | string     | null: false                    |
 | user              | references | null: false, foreign_key: true |
 | item              | references | null: false, foreign_key: true |

   ### Association
- belongs_to :user
- belongs_to :items