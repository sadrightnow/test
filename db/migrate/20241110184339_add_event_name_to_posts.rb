class AddEventNameToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :event_name, :string
  end
end
