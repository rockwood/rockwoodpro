class RecordingPolicy < ApplicationPolicy
  def show?
    user == record.user || record.pieces.any? { |p| p.shared? }
  end

  def update?
    record.user == user
  end

  def scoped_pieces
    record.user == user ? record.pieces : record.pieces.where(shared: true)
  end
end
