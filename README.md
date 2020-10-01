## ER図
![er](furima-29711.png)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null:false, unique:true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null:false|
|family_name_kana|string|null: false|
|first_name_kana|string|null:false|
|birthday|date|null: false|

### Association
- has_many :items, dependent: :destroy
- has_one :destination dependent: :destroy
- has_one :card dependent: :destroy

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|item_image|string|null:false|
|description|text|null: false|
|price|integer|null: false|
|category|string|null:false|
|condition|string|null: false|
|delivery_charge|integer|null:false|
|delivery_days|integer|null: false|
|user_id|refarences|null:false, foreign_key:true|
|prefecture_id|refarences|null: false, foreign_key:true|

### Association
- belongs_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture|string|null:false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|integer|null: false|
|user_id|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

# cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique:true|
|expiration_year|integer|null:false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
