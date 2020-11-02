class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :address
      t.string :postcode
      t.string :name
      t.timestamps
    end
  end
  
  
end
