class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number' }, inclusion: { in: 300..9999999, message: 'Out of setting range' }
  
  with_options presence: true, numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

end
