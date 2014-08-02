class RecordingPolicy < ApplicationPolicy
  def show?
    record.shared? || record.user == user
  end
end
