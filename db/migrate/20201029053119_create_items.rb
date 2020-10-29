class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.interger :category_id, null: false
      t.interger :item_status_id, null: false
      t.interger :shipping_charges_id, null: false
      t.interger :shipping_area_id, null: false
      t.interger :dyas_to_ship_id, null: false
      t.interger :price, null: false
      t.references, :user, foreign_key: true
      t.timestamps
    end
  end
end
