class ChangeOrdersColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :customer_id, false
    change_column_null :orders, :billing_amount,false
    change_column_null :orders, :shipping_fee, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :postcode, false
    change_column_null :orders, :address, false
    change_column_null :orders, :name, false
    change_column_null :orders, :status, false
  end
end
