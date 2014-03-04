class Recording < ActiveRecord::Base
  PLACEHOLDER_FILE = "temp.txt"

  belongs_to :user
  has_many :pieces

  validates :cds, :datetime, :dvds, :location, :level, :context, :user, :presence => true

  state_machine do
    event :request do
      transition all => :requested
    end

    event :confirm do
      transition all => :confirmed
    end

    event :finish do
      transition all => :finished
    end

    before_transition any => :confirmed do |recording|
      recording.create_directory
    end

    before_transition any => :finished do |recording|
      recording.discover_pieces
    end
  end

  def discover_pieces
    file_store.list_directory(directory).each do |filename|
      next if filename == PLACEHOLDER_FILE
      pieces.from_filename(filename).save
    end
  end

  def create_directory
    self.directory = default_directory if directory.blank?
    file_store.write_file("#{directory}/#{PLACEHOLDER_FILE}", location)
  end

  def default_directory
    [datetime.strftime("%Y-%m-%d"), user.first_name, user.last_name, SecureRandom.hex(4)].join('_')
  end

  def file_store
    @store ||= FileStore.new
  end

  def to_s
    "#{datetime.strftime("%Y-%m-%d")} #{user.full_name}"
  end

  def uid
    "recording-#{id}@rockwoodpro.com"
  end
end
