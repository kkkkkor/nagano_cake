class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :tax_included_price, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false


      t.timestamps
    end
  end
end
