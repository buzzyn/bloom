class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.references :bouquet, foreign_key: true
      t.string :recipient_name, required: true
      t.date :delivery_date, required: true
      t.references :order, foreign_key: true
      t.string :shipping_method, required: true, default: 'Standard'
      t.float :delivery_cost, required: true, default: '2.50'

      t.timestamps
    end
  end
end
