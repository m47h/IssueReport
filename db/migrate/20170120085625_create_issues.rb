class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.text :body
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
