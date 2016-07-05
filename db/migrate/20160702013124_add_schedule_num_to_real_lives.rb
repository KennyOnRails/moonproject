class AddScheduleNumToRealLives < ActiveRecord::Migration
  def change
    add_column :real_lives, :schedule_num, :integer
  end
end
