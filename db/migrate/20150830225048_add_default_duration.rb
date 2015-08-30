class AddDefaultDuration < ActiveRecord::Migration
  def change
    change_column :recordings, :duration, :float, :default => 1.0
  end
end
