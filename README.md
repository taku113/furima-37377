# README

## usersテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| e-mail                | string | null: false |
| password              | string | null: false |
| password confirmation | string | null: false |
| name                  | string | null: false |
| name-kana             | string | null: false |
| birthday              | string | null: false |

### Association

- has_many : items
- has_many : purchase


## itemsテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| item-name             | string | null: false |
| image                 | string | null: false |
| explanation           | string | null: false |
| category              | string | null: false |
| condition             | string | null: false |
| postage               | string | null: false |


### Association

- belongs_to : user
- belongs_to : purchase
- belongs_to : shipment

## purchaseテーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| shipment source       | string | null: false |
| delivery time         | string | null: false |
| price                 | string | null: false |
| commission            | string | null: false |
| benefit               | string | null: false |
| seller                | string | null: false |



### Association

- belongs_to : user
- belongs_to : item
- belongs_to : shipment


## Shipmentsテーブル

| Column                | Type   | Options     |
| --------------------- | -------| ------------|
| delivery address      | string | null: false |
| postal code           | string | null: false |
| prefecture            | string | null: false |
| city                  | string | null: false |
| address               | string | null: false |
| building name         | string |             |
| phone number          | string | null: false |
| buyer                 | string | null: false |


### Association

- belongs_to : user
- belongs_to : item
- belongs_to : purchase