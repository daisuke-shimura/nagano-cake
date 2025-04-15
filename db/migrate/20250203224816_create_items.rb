class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true
      t.integer :image_id
      t.integer :kind_id
      t.timestamps
    end
  end
end
