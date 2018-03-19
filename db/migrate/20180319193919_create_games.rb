class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :gameid
      t.string :title
      t.string :coverart

      t.timestamps
    end
    add_index :games, :gameid
  end
end
