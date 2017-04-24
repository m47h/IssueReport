class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :projects, :name
    add_index :projects, :user_id
    add_index :projects, [:name, :user_id]
    Project.create!(name: "First", user: User.first)
  end
end
