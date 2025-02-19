class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :delivery_cost
      t.integer :total_cost
      t.string :order_status
      t.string :make_status
      t.string :pay_method
      t.string :goal
      t.integer :total_amount
      t.timestamps
    end
  end
end
