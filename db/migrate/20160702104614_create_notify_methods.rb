class CreateNotifyMethods < ActiveRecord::Migration
  def change
    create_table :notify_methods do |t|
      t.integer :project_id
      t.string :email

      t.timestamps null: false
    end
  end
end
