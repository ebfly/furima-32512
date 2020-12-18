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
- has_one  :addresses

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
- belongs_to :users
- has_one :orders

## addresses テーブル

| Column              | Type         | Options                              |
| ------------------  | -----------  | -----------------------------------  |
| post_code           | string       | null: false, foreign_key :true       |
| prefecture          | integer      | null: false                          |
| city                | string       | null: false                          |
| address             | string       | null: false                          |
| building_name       | string       | null: false                          |
| phone_number        | integer      | null: false                          |

### Association
- has_one :users

## orders テーブル

| Column              | Type           | Options                              |
| ------------------  | -------------  | -----------------------------------  |
| user_id             | references     | null: false                          |
| item                | string         | null: false                          |

### Association

- belongs_to :users
- has_one    :items