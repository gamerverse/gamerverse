class CreateFavoriteGames < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_games do |t|

      t.timestamps
    end
  end
end
