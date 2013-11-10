class Recording < ActiveRecord::Base
  belongs_to :user
  has_many :pieces

  validates :cds, :datetime, :dvds, :location, :level, :context, :user, :presence => true

  state_machine do
    before_transition any => :requested do |recording|
      User.admins.each do |admin|
        AdminMailer.requested_recording(admin, recording).deliver
      end
      UserMailer.requested_recording(recording).deliver
    end

    before_transition any => :confirmed do |recording|
      UserMailer.confirmed_recording(recording).deliver
    end

    before_transition any => :finished do |recording|
      UserMailer.finished_recording(recording).deliver
    end

    event :request do
      transition all => :requested
    end

    event :confirm do
      transition all => :confirmed
    end

    event :finish do
      transition all => :finished
    end
  end

  def discover_pieces
    file_store.list_directory(directory).each do |filename|
      pieces.from_filename(filename).save
    end
  end

  def create_directory
    self.directory = default_directory if directory.blank?
    file_store.write_file("#{directory}/temp.txt", location)
  end

  def default_directory
    [datetime.strftime("%Y-%m-%d"), user.first_name, user.last_name, SecureRandom.hex(4)].join('_')
  end

  def file_store
    @store ||= FileStore.new
  end
end