class Recording < ActiveRecord::Base
  PLACEHOLDER_FILE = "temp.txt"

  belongs_to :user
  has_many :pieces, dependent: :destroy

  validates :cds, :datetime, :dvds, :location, :level, :context, :user, :duration, presence: true

  before_save :increment_change_count

  include AASM

  aasm column: 'state' do
    state :requested, initial: true
    state :confirmed
    state :finished

    event :request do
      transitions to: :requested
    end

    event :confirm, after: :create_directory do
      transitions to: :confirmed
    end

    event :finish, after: :discover_pieces do
      transitions to: :finished
    end
  end

  def discover_pieces
    pieces.destroy_all
    file_store.list_directory(directory).each do |filename|
      next if filename == PLACEHOLDER_FILE
      pieces.from_filename(filename).save
    end
  end

  def create_directory
    update(directory: default_directory) if directory.blank?
    file_store.write_file("#{directory}/#{PLACEHOLDER_FILE}", location)
  end

  def default_directory
    [datetime.strftime("%Y-%m-%d"), user.first_name, user.last_name, SecureRandom.hex(4)].join('_')
  end

  def file_store
    @store ||= FileStore.current
  end

  def to_s
    "#{datetime.strftime("%Y-%m-%d")} #{user.full_name}"
  end

  def uid
    "recording-#{id}@rockwoodpro.com"
  end

  def self.live_now
    Recording.find_by("embed_code IS NOT NULL AND datetime >= ? AND datetime <= ?", 6.hour.ago, 6.hours.from_now)
  end

  def increment_change_count
    self.change_count = change_count + 1
  end
end
