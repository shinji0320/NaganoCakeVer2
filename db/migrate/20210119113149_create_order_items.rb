class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :count
      t.integer :making_status, default: 0
      t.integer :purchased_price

      t.timestamps
    end
  end
end
