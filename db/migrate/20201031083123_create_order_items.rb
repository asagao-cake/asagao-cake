class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price_including_tax
      t.integer :item_count
      t.integer :production_status
      t.timestamps
    end
  end
end
