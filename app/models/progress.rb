class Progress < ActiveRecord::Base
  belongs_to :project, counter_cache: :progresses_count
  validates_presence_of :deadline, :description
  include AASM
  aasm do
    state :ready, initial: true
    state :completed

    event :confirm do
      transitions from: :ready, to: :completed
    end
  end
end
