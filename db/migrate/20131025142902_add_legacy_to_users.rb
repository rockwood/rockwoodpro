class AddLegacyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :legacy, :boolean, default: false
  end
end
