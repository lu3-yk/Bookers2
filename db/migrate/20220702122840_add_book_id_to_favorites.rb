class AddBookIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :book_id, :string
    add_index :favorites, :book_id
  end
end
