class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
