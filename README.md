# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
#freemarket_sample_52b
## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|text|null: false|
|status|integer|null: false|
|obligation_fee|integer|null: false|
|shipment_method|integer|null: false|
|prefecture|integer|null: false|
|brand|string|
|deliverytime|integer|null: false|
|price|integer|null: false|
|category1_id|references|null: false, foreign_key: true|
|category2_id|references|null: false, foreign_key: true|
|category3_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :category1
- belongs_to :category2
- belongs_to :category3
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|kanzi-surname|string|null: false|
|kanzi-name|string|null: false|
|kana-surname|string|null: false|
|kana-name|string|null: false|
|birthday|date|null: false|
|postal-code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|street_number|integer|null: false|
|building|string|
|phone-number|integer|
|card-number|integer|null: false|
|validated_date|date|null: false|
|securitycord|integer|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :products

## category1テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association
- has_many :products
- has_many :category2

## category2テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|category1_id|references|null: false, foreign_key: true|

### Association
- has_many :products
- belongs_to :category1
- has_many :category3

## category3テーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|category2_id|references|null: false, foreign_key: true|

### Association
- has_many :products
- belongs_to :category2
