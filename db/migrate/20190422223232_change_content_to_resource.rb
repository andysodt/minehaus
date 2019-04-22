class ChangeContentToResource < ActiveRecord::Migration[6.0]
  def change
    rename_table :contents, :resources
  end
end
