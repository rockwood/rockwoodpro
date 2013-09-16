class ChangeStateFromIntToString < ActiveRecord::Migration
  def change
    change_column :recordings, :state, :string
  end
end
