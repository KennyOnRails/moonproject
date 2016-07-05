class CreateRealLives < ActiveRecord::Migration
  def change
    create_table :real_lives do |t|
      t.string :schedule_type
      t.string :description
      t.string :notify_flag
      t.timestamps null: false
    end
  end
end
