class RemovePostIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_index :favorites, :post_id
    remove_column :favorites, :post_id, :string
  end
end
