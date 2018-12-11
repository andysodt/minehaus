class AddUuidToEveryTable < ActiveRecord::Migration[5.2]
  def up
    tables = [
      "posts",
      "users",
      "admin_users",
      "projects",
      "tasks",
      "active_storage_blobs",
      "active_storage_attachments",
    ]

    tables.each do |table|
      add_column table, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    end
  end
end
