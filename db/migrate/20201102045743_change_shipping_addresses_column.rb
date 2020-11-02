class ChangeShippingAddressesColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shipping_addresses, :customer_id, null: false
    change_column_null :shipping_addresses, :address, null: false
    change_column_null :shipping_addresses, :postcode, null: false
    change_column_null :shipping_addresses, :name, null: false
  end
end
