class CreateStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      t.references :store, null: false, index: true
      t.references :product, null: false, index: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
