class CreateOrdersPaids < ActiveRecord::Migration[7.0]
  def change
    create_table :orders_paids do |t|
      t.integer :cart_id
      t.string :item_name
      t.decimal :price, precision: 4, scale: 2
      t.string :size
      t.integer :quantity
      t.integer :total, precision: 4, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
