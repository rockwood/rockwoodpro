ActiveAdmin.register Recording do
  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :discover, :method => :post do
    recording = Recording.find(params[:id])
    recording.discover_pieces
    redirect_to action: :show
  end

  action_item only: :show do
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
    actions defaults: true do |recording|
      link_to('Discover Pieces', discover_admin_recording_path(recording), method: :post)
    end
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
          t.column(:filename) do |obj|
            link_to obj.filename, edit_admin_piece_path(obj)
          end
          t.column(:filetype)
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :datetime, :ampm => true
      f.input :location
      f.input :state_event, as: :radio, collection: recording.state_transitions.map { |s| [s.human_to_name, s.event, checked: recording.state == s.human_to_name] }
      f.input :level, as: :radio, collection: ["Audio and Video", "Audio Only"]
      f.input :context, as: :radio, collection: ["Live Performance", "Private Recording Session"]
      f.input :directory
      f.input :cds
      f.input :dvds
    end
    f.actions
  end
end
