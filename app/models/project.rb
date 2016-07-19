class Project < ActiveRecord::Base
  validates_presence_of :target, :subtarget, :success_define, :possible
  has_many :real_lives, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :notify, class_name:"NotifyMethod", dependent: :destroy
  has_one :photo, dependent: :destroy

  accepts_nested_attributes_for :notify, :reject_if=>:all_blank
  accepts_nested_attributes_for :photo,  :reject_if=>:all_blank

  before_create :generate_token!


  def add_confirm!
    self.confirm_count += 1
    self.save
  end
  def generate_token!
    self.token = SecureRandom.urlsafe_base64
  end
  include AASM
  aasm column: "project_state" do
    state :new, initial: true
    state :closed
    state :deleted

    event :close_project do
      transitions from: :new, to: :closed
    end
    event :delete_project do
      transitions from: :new, to: :deleted
    end
  end
end
