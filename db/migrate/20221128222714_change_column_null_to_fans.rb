class ChangeColumnNullToFans < ActiveRecord::Migration[6.1]
  def change
    change_column_null :fans, :following_id, false
    change_column_null :fans, :follower_id, false
  end
end
