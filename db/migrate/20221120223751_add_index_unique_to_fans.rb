class AddIndexUniqueToFans < ActiveRecord::Migration[6.1]
  def change
    add_index :fans, [:following_id, :follower_id], unique: true
  end
end
