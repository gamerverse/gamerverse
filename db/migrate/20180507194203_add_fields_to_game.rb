class AddFieldsToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :favorite_count, :integer
    add_column :games, :genre, :string
  end
end
