class RenameShippingChargesIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_charges_id, :delivery_burden_id
  end
end

