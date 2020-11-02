class ChangeItemsBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :is_sale, from: false, to: true
  end
end
