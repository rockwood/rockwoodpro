class AddSharedToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :shared, :boolean, default: false
  end
end
