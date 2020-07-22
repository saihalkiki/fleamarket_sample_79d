# フリマ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|lastname|string|null:false|
|firstname|string|null:false|
|lastnameread|string|null:false|
|firstnameread|string|null:false|
|gender|boolean|null:false|
|birthday|date|null:false|
|email|string|null: false|
|password|string|null: false|
|postal code|integer|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|housenumber|integer|null:false|
|post|references|null: false, foreign_key: true|
|comment|references|null: false, foreign_key: true|
|card|references|null: false, foreign_key: true|

### Association
- has_many :posts
- has_many :comments
- belongs_to :card

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|explanation|text|null: false|
|category|string|null: false|
|quality|string|null: false|
|deliverycost|integer|null: false|
|region|string|null: false|
|period|integer|null: false|
|price|integer|null: false|
|comment|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- has_many :comments

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|cvc number|string|null: false|
|card number|string|null: false|
|valid date|date|null: false|
|user|references|null: false, foreign_key: true|

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user