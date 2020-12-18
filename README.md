# README

## users テーブル

| Column                  | Type     | Options     |
| --------------------    | -------  | ----------- |
| nickname                | string   | null: false |
| email                   | string   | null: false |
| encrypted_password      | string   | null: false |
| family_name             | string   | null: false |
| first_name              | string   | null: false |
| family_name_kana        | string   | null: false |
| first_name_kana         | string   | null: false |
| birth_day               | date     | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル
※imageはActiveStorage

| Column                  | Type       | Options                        |
| ------------            | ---------  | ----------------------------   |
| name                    | string     | null: false                    |
| text                    | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| price                   | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| shipping_date_id        | integer    | null: false                    |
| shipping_fee_burden_id  | integer    | null: false                    |
| user                    | integer    | null: false,  foreign_key true |

### Association 
- belongs_to :user
- has_one :order

## addresses テーブル

| Column           | Type         | Options                       |
| ---------------  | -----------  | ---------------------------   |
| post_code        | string       | null: false                   |
| prefecture_id    | integer      | null: false                   |
| city             | string       | null: false                   |
| address          | string       | null: false                   |
| building_name    | string       |                               |
| phone_number     | string       | null: false                   |
| order            | references   | null: false, foreign_key true |

### Association
- belongs_to :order

## orders テーブル

| Column        | Type           | Options                           |
| ------------  | -------------  | --------------------------------  |
| user          | references     | null: false, foreign_key true     |
| item          | references     | null: false, foreign_key true     |

### Association

- has_one       :address
- belongs_to    :user
- belongs_to    :item