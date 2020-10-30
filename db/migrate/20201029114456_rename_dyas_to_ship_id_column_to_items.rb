class RenameDyasToShipIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :dyas_to_ship_id, :days_to_ship_id
  end
end
