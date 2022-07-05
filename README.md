# DB 設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| first_name         | text   | null: false               |
| last_name          | text   | null: false               |
| first_name_kana    | text   | null: false               |
| last_name_kana     | text   | null: false               |
| nick_name          | text   | null: false               |
| birthday           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item_image      | image      | null: false                    |
| item_name       | text       | null: false                    |
| category        | text       | null: false                    |
| explanation     | text       | null: false                    |
| situation       | text       | null: false                    |
| delivery_charge | text       | null: false                    |
| shipment_source | text       | null: false                    |
| days_to_ship    | text       | null: false                    |
| price           | string     | null: false                    |
| delivery_change | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :purchases

## purchases table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| buyer         | text       | null: false                    |
| payment_method| text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :adds

## adds table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefectures    | text       | null: false                    |
| municipalities | text       | null: false                    |
| address        | text       | null: false                    |
| building_name  | text       | null: false                    |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
