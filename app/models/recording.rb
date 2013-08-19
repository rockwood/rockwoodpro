class Recording < ActiveRecord::Base
  belongs_to :user

  validates :cds, :datetime, :dvds, :location, :state, :level, :context, :user, :presence => true

  state_machine initial: :unconfirmed do
    state :unconfirmed, value: 0
    state :confirmed, value: 1
    state :finished, value: 2
    state :removed, value: 3

    event :confirm do
      transition :unconfirmed => :confirmed
    end

    event :finish do
      transition :confirmed => :finished
    end
  end
end