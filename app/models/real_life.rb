class RealLife < ActiveRecord::Base
  validates_presence_of :schedule_type, :description, :notify_flag, :schedule_num
  belongs_to :project
end
