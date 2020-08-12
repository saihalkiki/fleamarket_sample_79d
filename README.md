# アプリ名 name
* FURIMA

# 概要 Description
* フリマアプリのクローンサイト
 * 購入や商品出品、ユーザー同士で売買のできる機能を再現した。
 * 4人チームでアジャイル開発を行った。
# 制作背景 Making background
  * FURIMAによる課題解決
  * ユーザー同士で物をオンラインで売買出来る。
  * オンラインで行えるのでお店に持ち込む手間がなくなる。
  * uxを意識して、操作性を重視した。
  * 

# 環境条件 Requirement/gem
 * Ruby'2.6.5'
 * Rails'~> 6.0.0'


## 説明 Features
* haml/SASS記法と、命名規則BEMを使ったマークアップ
* SNS認証による新規登録、ログイン
* pay.jpによる購入処理クレジットカード登録
* カテゴリー表示、コメント、ajaxを使用した非同期処理
* RSpecを使った単体テスト
* お気に入り登録


# 本番環境
* 本番環境のIPアドレス
  http://54.248.73.192/
* basic認証のID、パスワード
  ID:adminuser
  PW:passwordhogehoge



# 使用技術
* Haml
* Saas
* Git(GitHub)
* Jquery
* Ruby
* Ruby on Rails
* AWS





# 課題や今後実装したい機能
* お気に入り登録の非同期化
* フォロー機能
* カテゴリー別検索機能
* パンくず


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
|user|references|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

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
|postal_code|string|null:false|
|prefecture_id|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string|null:false|
|phone_number|string|null:false|
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

