class Project < ActiveRecord::Base
  validates_presence_of :target, :subtarget, :success_define, :possible
  has_many :real_lives, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :notify, class_name:"NotifyMethod", dependent: :destroy
  before_create :generate_token!

  accepts_nested_attributes_for :notify, :reject_if=>:all_blank

  def add_confirm!
    self.confirm_count += 1
    self.save
  end
  def generate_token!
    self.token = SecureRandom.urlsafe_base64
  end
end
