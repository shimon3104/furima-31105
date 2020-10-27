# frimaテーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_ruby    | string | null: false |
| last_name_ruby     | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |    
| birthday           | data   | null: false |
| nickname           | string | null: false |

### Association

- has_many :items
- has_many :orders


##  items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| description              | text       | null: false                    |
| category_id   *2         | integer    | null: false                    |
| item_status_id   *2      | integer    | null: false                    |
| shipping_charges_id   *2 | integer    | null: false                    |
| shipping_area_id   *2    | integer    | null: false                    |
| days_to_ship_id   *2     | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key :true |

*1  imageはActive_Storageで保存
*2  active_hash使用

### Association

- belongs_to :user
- has_one :order


##  orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key :true |
| item   | references | null: false, foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :receive


##  receives テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures_id   *2 | integer    | null: false                    |
| city_name           | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| order               | references | null: false, foreign_key :true |

*2  active_hash使用

### Association

- belongs_to :order

