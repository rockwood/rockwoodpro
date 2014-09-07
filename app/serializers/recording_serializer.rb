class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :location, :cds, :dvds, :datetime, :program_file, :directory, :created_at, :updated_at, 
    :level, :context, :state

  embed :ids, include: true

  has_many :pieces
  has_one :user

  def pieces
    RecordingPolicy.new(scope, object).scoped_pieces
  end
end
