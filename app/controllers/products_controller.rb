class ProductsController < ApplicationController
  def index
  end
end
## adressテーブル
|Column|Type|Option|
|------|----|------|
|birthday|date|null: false|
|postal-code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :secoundcategorys