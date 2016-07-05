class AddProjectIdToRealLife < ActiveRecord::Migration
  def change
    add_column :real_lives, :project_id, :integer
  end
end
