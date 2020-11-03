class ChangeCustomersColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :phone_number, false
    change_column_null :customers, :postcode, false
    change_column_null :customers, :address, false
  end
end
