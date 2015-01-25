class MakePiecesPrivateByDefault < ActiveRecord::Migration
  def change
    change_column :pieces, :shared, :boolean, default: false
  end
end
