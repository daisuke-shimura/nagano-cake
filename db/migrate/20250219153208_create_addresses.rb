class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :number
      t.string :place
      t.string :name
      t.timestamps
    end
  end
end
