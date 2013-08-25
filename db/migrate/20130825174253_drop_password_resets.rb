class DropPasswordResets < ActiveRecord::Migration
  def change
    drop_table :password_resets
  end
end
