class Recording < ActiveRecord::Base
  belongs_to :user
  has_many :pieces

  validates :cds, :datetime, :dvds, :location, :state, :level, :context, :user, :presence => true

  state_machine initial: :unconfirmed do
    state :unconfirmed, value: 0
  end

  def create_directory(service = S3Object)
    self.directory = default_directory if directory.blank?
    service.store("#{directory}/temp.txt", location)
  end

  def default_directory
    [datetime.strftime("%Y-%m-%d"), user.first_name, user.last_name, SecureRandom.hex(4)].join('_')
  end
end