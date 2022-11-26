class ChangeColumnNullToReports < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reports, :user_id, false
  end
end
