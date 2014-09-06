class RecordingSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :pieces

  attributes :id, :location, :cds, :dvds, :datetime, :program_file, :directory, :created_at, :updated_at, 
    :level, :context, :state

  def pieces
    RecordingPolicy.new(scope, object).scoped_pieces
  end
end
