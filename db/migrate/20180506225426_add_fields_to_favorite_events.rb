class AddFieldsToFavoriteEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :favorite_events, :user_id, :integer
    add_column :favorite_events, :event_id, :integer
  end
end
