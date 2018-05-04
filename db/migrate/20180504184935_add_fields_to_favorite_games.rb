class AddFieldsToFavoriteGames < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_games, :user_id, :integer
    add_column :favorite_games, :game_id, :integer
    add_column :favorite_games, :favorite_game, :integer
  end
end
