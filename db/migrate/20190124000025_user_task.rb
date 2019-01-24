class UserTask < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :admin_user_id, :user_id
  end
end
