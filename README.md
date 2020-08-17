# テーブル設計

## users テーブル

| Colum               | Type     | options     |
| ------------------- | -------- | ----------- |
| name                | string   | null: false |
| email               | string   | null: false |
| password            | string   | null: false |
| first_name          | string   | null: false |
| last_name           | string   | null: false |
| first_name_phonetic | string   | null: false |
| last_name_phonetic  | string   | null: false |
| birthday            | date     | null: false |


### Association

- has_many :items
- has_many :buys

## items テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| user                   | references   | null: false, foreign_key: true |
| image                  | string       | null: false                    |
| name                   | string       | null: false                    |
| text                   | text         | null: false                    |
| price                  | integer      | null: false                    |

### Association

- has_many   :buys
- belongs_to :user

## pays テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| user                   | references   | null: false, foreign_key: true |
| item                   | references   | null: false, foreign_key: true |


### Association

- has_one   :address

## addresses テーブル
| Colum                  | Type         | options                        |
| ---------------------- | ------------ | ------------------------------ |
| pays                   | references   | null: false, foreign_key: true |
| post_number            | string       | null: false                    |
| city                   | string       | null: false                    |
| address                | string       | null: false                    |
| building_name          | string       |                                |
| phone_number           | string       | null: false                    |

### Association

- belongs_to :pays
