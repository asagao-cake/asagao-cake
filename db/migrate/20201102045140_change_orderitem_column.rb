class ChangeOrderitemColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_items, :order_id, null: false
    change_column_null :order_items, :item_id, null: false
    change_column_null :order_items, :price_including_tax, null: false
    change_column_null :order_items, :item_count, null: false
    change_column_null :order_items, :production_status, null: false
  end
end
