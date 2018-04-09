class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      #add_foreign_key :events, :users

      t.string :title
      t.string :location
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
