class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
  end
  
end
