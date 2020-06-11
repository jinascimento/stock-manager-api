class CreateStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      t.references :store, null: false, index: true
      t.references :product, null: false, index: true
      t.integer :remaining_amount, null: false, default: 0
      t.timestamps
    end
  end
end
