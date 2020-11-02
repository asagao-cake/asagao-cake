class ChangeItemsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :genre_id, null: false
    change_column_null :items, :name, null: false
    change_column_null :items, :description, null: false
    change_column_null :items, :price, null: false
    change_column_null :items, :image_id, null: false
    change_column_null :items, :is_sale, null: false
  end
end
