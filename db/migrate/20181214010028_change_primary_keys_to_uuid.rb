# frozen_string_literal: true

class ChangePrimaryKeysToUuid < ActiveRecord::Migration[5.2]
  def up
    tables = %w[
      active_admin_comments
      active_storage_attachments
      active_storage_blobs
      users
      posts
      projects
      tasks
    ]

    tables.each do |table|
      remove_column table, :id
      rename_column table, :uuid, :id
      execute "ALTER TABLE #{table} ADD PRIMARY KEY (id);"
    end
  end
end
