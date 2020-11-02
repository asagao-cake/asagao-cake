class ChangeOrdersColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :orders, :customer_id, null: false
    change_column_null :orders, :billing_amount, null: false
    change_column_null :orders, :shipping_fee, null: false
    change_column_null :orders, :payment_method, null: false
    change_column_null :orders, :postcode, null: false
    change_column_null :orders, :address, null: false
    change_column_null :orders, :name, null: false
    change_column_null :orders, :status, null: false
  end
end
