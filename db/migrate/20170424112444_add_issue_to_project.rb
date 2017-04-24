class AddIssueToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :project_id, :integer, null: false, default: 1
    add_index :issues, :project_id
    add_index :issues, [:project_id, :user_id]
  end
end
