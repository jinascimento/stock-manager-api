class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.integer :net_weight
      t.decimal :cost_price, null: false, precision: 15, scale: 2
      t.decimal :price, null: false, precision: 15, scale: 2
      t.references :stock_item, null: false, index: true
      t.timestamps
    end
  end
end
