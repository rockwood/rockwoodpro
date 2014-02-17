class PieceSerializer < ActiveModel::Serializer
  attributes :id, :composer, :filename, :filetype, :performer, :recording_id, :track_number, :title, :updated_at, :year, :file_url, :poster_url

  def poster_url
    "#{ENV.fetch('CDN_ROOT')}/poster.jpg"
  end
end