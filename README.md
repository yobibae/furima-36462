# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false, unique: true |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday_yy        | integer             | null: false               |
| birthday_mm        | integer             | null: false               |
| birthday_dd        | integer             | null: false               |

### Association

* has_many :items
* has_many :orders


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| info                                | text       | null: false                    |
| category                            | string     | null: false                    |
| sales_status                        | string     | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |
| item_shipping_fee_status            | string     | null: false                    |
| item_prefecture                     | string     | null: false                    |
| item_scheduled_delivery             | string     | null: false                    |


### Association

* belongs_to :user
* belongs_to :order

## orders table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| card_number    | string     | null: false                    |
| card_exp_month | integer    | null: false                    |
| card_exp_year  | integer    | null: false                    |
| card_cvc       | integer    | null: false                    |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_one :item