class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :bands
      t.string :time
      t.string :event_date
      t.string :membership_required
      t.string :Suggested_Donation
      t.string :Genre

      t.timestamps
    end
  end
end
