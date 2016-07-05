class AddAasmStateToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :aasm_state, :string, default: "ready"  
  end
end
