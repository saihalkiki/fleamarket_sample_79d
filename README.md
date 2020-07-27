# フリマ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_read|string|null:false|
|first_name_read|string|null:false|
|gender|integer|null:false|
|birthday|date|null:false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :cards
- has_one :address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|quality|string|null: false|
|delivery_cost|integer|null: false|
|region|string|null: false|
|period|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|prefecture|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :comments
- has_many :images
- belongs_to :category

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|cvc_number|string|null: false|
|card_number|string|null: false|
|valid_date|date|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null:false|
|prefectures|string|null:false|
|city|string|null:false|
|house_number|integer|null:false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many :items

