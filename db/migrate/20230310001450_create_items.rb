class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.string :category
      t.integer :quantity
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
