class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :category
  end
  
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'Include both numbers' }
  validates :category_id, numericality: { other_than: 0 }
  validates :item_status_id, numericality: { other_than: 0 }
end
