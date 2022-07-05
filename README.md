# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| nick_name          | string              | null: false               |
| birthday           | date                | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| category_id                         | integer    | null: false                    |
| explanation                         | text       | null: false                    |
| situation_id                        | integer    | null: false                    |
| delivery_charge_id                  | integer    | null: false                    |
| shipment_source_id                  | integer    | null: false                    |
| days_to_ship_id                     | integer    | null: false                    |
| price                               | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :add

## adds table

| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| post_code         | string     | null: false                    |
| shipment_source_id| integer    | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
