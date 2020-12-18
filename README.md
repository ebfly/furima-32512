# README

## users テーブル

| Column                | Type     | Options     |
| --------------------  | -------  | ----------- |
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| profile               | string   | null: false |
| family_name           | string   | null: false |
| first_name            | string   | null: false |
| family_name_kana      | string   | null: false |
| first_name_kana       | string   | null: false |
| birth_day             | date     | null: false |

### Association
- has_many :items
- has_many :orders
- has_one  :address

## items テーブル

| Column            | Type       | Options                       |
| ------------      | ---------  | ----------------------------  |
| name              | string     | null: false, foreign_key true |
| image             | ---------  | ----------------------------  |
| text              | text       | null: false                   |
| category          | integer    | null: false                   |
| condition         | integer    | null: false                   |
| price             | integer    | null: false                   |
| prefecture        | integer    | null: false                   |
| shipping_date     | integer    | null: false                   |
| user_id           | integer    | null: false                   |

### Association 
- belongs_to :user
- has_one :order

## addresses テーブル

| Column           | Type      | Options                         |
| ---------------  | -------   | ------------------------------  |   
| post_code        | string    | null: false, foreign_key :true  |
| prefecture_id    | integer   | null: false                     |
| city             | string    | null: false                     |
| address          | string    | null: false                     |
| building_name    | string    |                                 |
| phone_number     | string    | null: false                     |

### Association
- belongs_to :user
- belongs_to :order

## orders テーブル

| Column        | Type           | Options                           |
| ------------  | -------------  | --------------------------------  |
| user          | references     | null: false                       |
| item          | string         | null: false                       |

### Association

- has_one       :address
- belongs_to    :user
- belongs_to    :item