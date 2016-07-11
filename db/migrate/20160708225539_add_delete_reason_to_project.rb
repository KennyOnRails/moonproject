class AddDeleteReasonToProject < ActiveRecord::Migration
  def change
    add_column :projects, :project_state, :string, default: "new"
    add_column :projects, :delete_reason, :string
  end
end
