class AddIssueToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :project_id, :integer, null: false, default: 0
    Issue.all.each do |issue|
      issue.update_attributes!(project_id: Project.first.id || 1)
    end
    add_index :issues, :project_id
    add_index :issues, [:project_id, :user_id]
  end
end
