class AddSharedToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :shared, :boolean, default: false
    remove_column :recordings, :shared
  end
end
