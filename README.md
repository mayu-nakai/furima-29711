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
- has_many :oders

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|category|string|null:false|
|condition|string|null: false|
|delivery_charge|integer|null:false|
|delivery_days|integer|null: false|
|user|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
- has_one :order

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|integer|null:false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|oder|refarences|null:false, foreign_key:true|

### Association
- belongs_to :oder

# odersテーブル
|Column|Type|Options|
|------|----|-------|
|user|refarences|null:false, foreign_key:true|
|item|refarences|null:false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination
