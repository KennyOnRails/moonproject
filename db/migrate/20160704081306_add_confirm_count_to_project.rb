class AddConfirmCountToProject < ActiveRecord::Migration
  def change
    add_column :projects, :confirm_count, :integer, default: 0
  end
end
