class YetMoreForeignKeys < ActiveRecord::Migration[5.2]
  def up
    remove_column 'active_storage_attachments', 'blob_id'
    add_column 'active_storage_attachments', 'blob_id', :uuid
  end
end
