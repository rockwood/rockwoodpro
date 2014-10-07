class AddEmbedCodeToRecordings < ActiveRecord::Migration
  def change
    add_column :recordings, :embed_code, :string
  end
end
