class ChangeCustomersColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :last_name, null: false
    change_column_null :customers, :first_name, null: false
    change_column_null :customers, :last_name_kana, null: false
    change_column_null :customers, :first_name_kana, null: false
    change_column_null :customers, :phone_number, null: false
    change_column_null :customers, :postcode, null: false
    change_column_null :customers, :address, null: false
  end
end
