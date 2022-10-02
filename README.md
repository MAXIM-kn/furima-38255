# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_day          | data   | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false,                   |
| state              | srring     | null: false,                   |
| shippong_cost      | srring     | null: false,                   |
| shippong_area      | srring     | null: false,                   |
| shippong_days      | srring     | null: false,                   |
| price              | srring     | null: false,                   |
| category           | srring     | null: false,                   |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| Prefectures     | srring     | null: false,                   |
| municipalities  | srring     | null: false,                   |
| address         | srring     | null: false,                   |
| Building name   | srring     |                                |
| phone_number    | srring     | null: false,                   |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record