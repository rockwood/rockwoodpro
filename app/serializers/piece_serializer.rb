class PieceSerializer < ActiveModel::Serializer
  attributes :id, :composer, :filename, :filetype, :performer, :recording_id, :track_number, :title, :updated_at, :year, :file_url
end