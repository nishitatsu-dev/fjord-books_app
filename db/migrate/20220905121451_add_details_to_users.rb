class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zip_code, :text
    add_column :users, :address, :text
    add_column :users, :self_bio, :text
  end
end
