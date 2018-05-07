class CreateFavoriteEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_events do |t|

      t.timestamps
    end
  end
end
