class CreatePasswordReset < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.string :token
      t.datetime :expiration
      t.references :user
      t.timestamps
    end
  end
end
