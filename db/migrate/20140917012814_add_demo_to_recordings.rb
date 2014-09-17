class AddDemoToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :demo, :boolean, default: false
  end
end
