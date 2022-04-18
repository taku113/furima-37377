# README

## usersテーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false, unique : true |
| encrypted_password    | string   | null: false |
| first_name            | string   | null: false |
| family_name           | string   | null: false |
| first_name_kana       | string   | null: false |
| family_name_kana      | string   | null: false |
| birthday              | date     | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| item_name             | string     | null: false |
| explanation           | text       | null: false |
| category_id           | integer    | null: false |
| condition_id          | integer    | null: false |
| postage_id            | integer    | null: false |
| prefecture_id         | integer    | null: false |
| delivery_time_id      | integer    | null: false |
| user_id               | references | null: false, foreign_key: true |
| price                 | integer    | null: false |


### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| user_id               | references | null: false, foreign_key: true |
| item_id               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment


## Shipmentsテーブル

| Column                | Type    | Options     |
| --------------------- | --------| ------------|
| postal_code           | string  | null: false |
| prefecture_id         | integer | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| building_name         | string  |             |
| phone_number          | string  | null: false |
| user_id               | references  | null: false, foreign_key: true |


### Association
- belongs_to :shipment