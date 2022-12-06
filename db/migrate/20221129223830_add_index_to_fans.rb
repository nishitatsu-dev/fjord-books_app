class AddIndexToFans < ActiveRecord::Migration[6.1]
  def change
    add_index :fans, :follower_id
  end
end
