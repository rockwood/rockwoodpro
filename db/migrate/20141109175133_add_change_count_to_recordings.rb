class AddChangeCountToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :change_count, :integer, default: 1
  end
end
