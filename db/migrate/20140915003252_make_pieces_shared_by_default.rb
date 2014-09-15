class MakePiecesSharedByDefault < ActiveRecord::Migration
  def change
    change_column :pieces, :shared, :boolean, default: true
  end
end
