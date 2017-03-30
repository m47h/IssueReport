class AddUserToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :user_id, :integer, null: false
    Issue.all.each do |issue|
      issue.update_attributes!(user_id: User.first.id)
    end
    add_index :issues, :user_id
  end
end
