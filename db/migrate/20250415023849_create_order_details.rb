class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :amount
      t.integer :plice
      t.string :make_status
      t.timestamps
    end
  end
end
