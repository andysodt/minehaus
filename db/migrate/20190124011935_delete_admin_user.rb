class DeleteAdminUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :admin_users
  end
end
