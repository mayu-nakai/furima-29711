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
- has_many :items
- has_many :orders

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|category_id|integer|null:false|
|condition_id|integer|null: false|
|delivery_charge_id|integer|null:false|
|delivery_day_id|integer|null: false|
|prefecture_id|integer|null: false, foreign_key:true|
|user|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
- has_one :order

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_id|integer|null:false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|oder|refarences|null:false, foreign_key:true|

### Association
- belongs_to :order

# ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|refarences|null:false, foreign_key:true|
|item|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination
