class ChangeCartItemsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :customer_id, null: false
    change_column_null :cart_items, :item_id, null: false
    change_column_null :cart_items, :item_count, null: false
  end
end
