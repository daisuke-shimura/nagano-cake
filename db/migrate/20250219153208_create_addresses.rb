class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.integer :order_id
      t.integer :number
      t.string :place
      t.string :name
      t.timestamps
    end
  end
end
