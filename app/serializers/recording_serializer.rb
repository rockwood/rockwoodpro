class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :location, :cds, :dvds, :datetime, :program_file, :directory, :created_at, :updated_at,
    :level, :context, :state, :permissions

  embed :ids, include: true

  has_many :pieces
  has_one :user

  def pieces
    policy.scoped_pieces
  end

  def permissions
    {
      update: policy.update?
    }
  end

  def policy
    @policy ||= RecordingPolicy.new(scope, object)
  end
end
