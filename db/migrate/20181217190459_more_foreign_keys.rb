# frozen_string_literal: true

class MoreForeignKeys < ActiveRecord::Migration[5.2]
  def up
    remove_column 'active_storage_attachments', 'record_id'
    add_column 'active_storage_attachments', 'record_id', :uuid
    remove_column 'active_admin_comments', 'resource_id'
    add_column 'active_admin_comments', 'resource_id', :uuid
  end
end
