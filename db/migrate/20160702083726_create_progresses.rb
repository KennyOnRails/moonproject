class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :project_id
      t.string :deadline
      t.string :description

      t.timestamps null: false
    end
  end
end
