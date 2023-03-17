class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.string :category
      t.integer :quantity
      t.decimal :price, precision: 4, scale: 2
      t.string :description
      # t.references :admin_user
      t.timestamps
    end
  end
end
