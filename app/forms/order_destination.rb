class OrderDestination
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
