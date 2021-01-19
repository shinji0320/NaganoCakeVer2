class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :detail
      t.string :image_id
      t.integer :price
      t.boolean :is_sold, default: true, null: false

      t.timestamps
    end
    add_index :items, :name, unique: true
  end
end
