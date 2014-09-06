class RecordingPolicy < ApplicationPolicy
  def show?
    true
  end

  def scoped_pieces
    record.user == user ? record.pieces : record.pieces.where(shared: true)
  end
end
