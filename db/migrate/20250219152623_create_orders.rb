class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :delivery_fee, null: false
      t.integer :total_cost, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :post_number, null: false
      t.integer :pay_method ,null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
