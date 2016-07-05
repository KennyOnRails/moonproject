class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :target
      t.string :subtarget
      t.string :success_define
      t.string :possible

      t.timestamps null: false
    end
  end
end
