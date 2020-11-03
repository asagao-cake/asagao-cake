class ChangeItemsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :genre_id, :integer, null: false
    change_column :items, :name, :string,  null: false
    change_column :items, :description, :text, null: false
    change_column :items, :price, :integer, null: false
    change_column :items, :image_id, :integer, null: false
  end
end
