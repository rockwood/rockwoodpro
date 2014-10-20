class AddLiveSteamToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :live_stream, :boolean
  end
end
