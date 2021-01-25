class ChangeCountOfCartItems < ActiveRecord::Migration[5.2]
  def up
    change_column :cart_items, :count, :integer
  end

  def down
    change_column :cart_items, :count, :integer, default: 1
  end
end
