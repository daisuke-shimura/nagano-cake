class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :plice
      t.string :make_status
      t.timestamps
    end
  end
end
