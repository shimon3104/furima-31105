class OrderReceive
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city_name, :address, :building_name, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city_name
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Input only number" }
  end

  def save
    order = Order.create(user_id: current_user.id, item_id: params[item.id])
    Receive.create(postal_code: postal_code, presence: presence, city_name: city_name, address: address, phone_number: phone_number, order_id: order.id)
  end
end