class AddFieldToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :attending_count, :integer
  end
end
