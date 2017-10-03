class AddThreeMonthBundleToOrders < ActiveRecord::Migration[5.1]
   def up
    add_column :orders, :three_month_bundle, :boolean, default: false
  end

  def down
    remove_column :orders, :three_month_bundle, :boolean
  end
end
