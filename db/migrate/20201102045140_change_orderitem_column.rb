class ChangeOrderitemColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_items, :order_id,false
    change_column_null :order_items, :item_id, false
    change_column_null :order_items, :price_including_tax, false
    change_column_null :order_items, :item_count, false
    change_column_null :order_items, :production_status, false
  end
end
