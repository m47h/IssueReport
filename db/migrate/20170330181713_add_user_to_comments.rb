class AddUserToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer, null: false, default: 1
    add_index :comments, :user_id
  end
end
