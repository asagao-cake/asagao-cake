class ChangeShippingAddressesColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :shipping_addresses, :customer_id, false
    change_column_null :shipping_addresses, :address, false
    change_column_null :shipping_addresses, :postcode, false
    change_column_null :shipping_addresses, :name, false
  end
end
