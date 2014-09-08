class PiecePolicy < ApplicationPolicy
  def update?
    record.recording.user == user
  end
end
