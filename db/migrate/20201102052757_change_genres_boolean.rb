class ChangeGenresBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column_default :genres, :is_valid, from: false, to: true
  end
end
