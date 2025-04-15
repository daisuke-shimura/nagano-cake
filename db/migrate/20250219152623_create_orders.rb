class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :delivery_cost
      t.integer :total_cost
      t.string :order_status, null: false
      t.string :make_status, null: false
      t.string :pay_method
      t.string :goal
      t.integer :amount
      t.timestamps
    end
  end
end
