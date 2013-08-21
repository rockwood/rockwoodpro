ActiveAdmin.register Recording do
  index do
    column :user
    column "Date/Time", :datetime
    column :location
    column :state
    column :context
    column :level
    column "CDs", :cds
    column "DVDs", :dvds
    default_actions
  end

  show do |recording|
    attributes_table do
      row :user
      row :datetime
      row :location
      row :state
      row :context
      row :level
      row :cds
      row :dvds
      # row :pieces do
      #   table_for recording.pieces do |t|
      #     t.column(:title)
      #     t.column(:performer)
      #     t.column(:composer)
      #     t.column(:track_number)
      #     t.column(:track_count)
      #     t.column(:year)
      #     t.column(:filetype)
      #     t.column(:filename)
      #   end
      # end
    end

  end
  form do |f|
    f.inputs do
      f.input :user
      f.input :datetime, :ampm => true
      f.input :location
      f.input :state, :include_blank => false
      f.input :context, :include_blank => false
      f.input :level, :include_blank => false
      f.input :directory
      f.input :cds
      f.input :dvds
      # f.has_many :pieces do |piece|
      #   piece.input :title
      #   piece.input :performer
      #   piece.input :composer
      #   piece.input :track_number
      #   piece.input :year
      #   piece.input :filename
      #   piece.input :filetype, :collection => Piece::FILETYPES, :include_blank => false
      #   piece.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove'
      # end
    end
    f.actions
  end
end
