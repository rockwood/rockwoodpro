class AddDurationToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :duration, :float
  end
end
