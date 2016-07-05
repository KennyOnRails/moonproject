class AddProgressesCountToProject < ActiveRecord::Migration
  def change
    add_column :projects, :progresses_count, :integer, default: 0
  end
end
