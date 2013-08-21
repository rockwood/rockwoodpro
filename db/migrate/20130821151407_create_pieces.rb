class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :performer
      t.string :composer
      t.integer :track_number
      t.integer :year
      t.string :filetype
      t.string :filename
      t.references :recording
      t.timestamps
    end
  end
end