# テーブル設計

## users テーブル

| Colum          | Type     | options     |
| -------------- | -------- | ----------- |
| name           | string   | null: false |
| email          | string   | null: false |
| password       | string   | null: false |
| first_name     | string   | null: false |
| last_name      | string   | null: false |
| birthday_year  | string   | null: false |
| birthday_month | string   | null: false |
| birthday_day   | string   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| user                   | references   | null: false, foreign_key: true |
| image                  | string       | null: false                    |
| item_name              | string       | null: false                    |
| text                   | string       | null: false                    |
| category               | string       | null: false                    |
| condition              | string       | null: false                    |
| postage                | string       | null: false                    |
| exhibitor_prefecture   | string       | null: false                    |
| days                   | string       | null: false                    |
| price                  | integer      | null: false                    |

### Association

- has_many   :buys
- belongs_to :users

## pays テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| user                   | references   | null: false, foreign_key: true |
| item                   | references   | null: false, foreign_key: true |
| curd_number            | integer      | null: false                    |
| month                  | integer      | null: false                    |
| year                   | integer      | null: false                    |
| security_code          | integer      | null: false                    |

### Association

- belongs_to :items
- belongs_to :users
- has_one   :addresses

## addresses テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| pays_id                | references   | null: false, foreign_key: true |
| post_number            | integer      | null: false                    |
| buyer_prefecture       | string       | null: false                    |
| city                   | string       | null: false                    |
| address                | string       | null: false                    |
| building_name          | string       |                                |
| phone_number           | integer      | null: false                    |

### Association

- belongs_to :buys
