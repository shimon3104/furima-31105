class OrderReceive
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city_name
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Input only number" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Receive.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end