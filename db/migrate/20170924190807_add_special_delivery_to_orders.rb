class AddSpecialDeliveryToOrders < ActiveRecord::Migration[5.1]
  def up
    add_column :orders, :special_delivery, :boolean, default: false
  end

  def down
    remove_column :orders, :special_delivery, :boolean
  end
end
