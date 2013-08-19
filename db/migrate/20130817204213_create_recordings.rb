class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.integer :state
      t.string :context
      t.string :level
      t.string :location
      t.integer :cds
      t.integer :dvds
      t.datetime :datetime
      t.string :program_file
      t.string :directory
      t.timestamps
      t.references :user

      t.index :state
    end
  end
end
