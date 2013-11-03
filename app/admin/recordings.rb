ActiveAdmin.register Recording do
  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :discover, :method => :post do
    recording = Recording.find(params[:id])
    recording.discover_pieces!
    redirect_to action: :show, notice: "Pieces Discovered!"
  end

  action_item do
    link_to('Discover Pieces', discover_admin_recording_path(recording), method: :post)
  end

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
      row :pieces do
        table_for recording.pieces do |t|
          t.column(:title)
          t.column(:performer)
          t.column(:composer)
          t.column(:track_number)
          t.column(:year)
          t.column(:filetype)
          t.column(:filename)
        end
      end
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
    end
    f.actions
  end
end
