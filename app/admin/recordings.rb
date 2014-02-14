ActiveAdmin.register Recording do
  config.sort_order = "datetime_desc"

  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :confirm, method: :post do
    recording = Recording.find(params[:id])
    recording.confirm!
    RecordingMailer.confirmed(recording).deliver
    redirect_to action: :index
  end

  member_action :finish, method: :post do
    recording = Recording.find(params[:id])
    recording.finish!
    RecordingMailer.finished(recording).deliver
    redirect_to action: :index
  end

  member_action :discover, method: :post do
    recording = Recording.find(params[:id])
    recording.discover_pieces
    redirect_to action: :show
  end

  action_item only: [:show, :edit] do
    link_to('Discover Pieces', discover_admin_recording_path(recording), method: :post)
  end

  index do
    column "Date/Time" do |recording|
      link_to(l(recording.datetime, format: :medium), admin_recording_path(recording))
    end
    column :user
    column :location
    column :context
    column :level
    column :cds
    column :dvds
    column :pieces do |recording|
      recording.pieces.count
    end
    column :state do |recording|
      status_tag(recording.state, color_for_state(recording.state))
    end
    column { |r| link_to('Confirm', confirm_admin_recording_path(r), method: :post, class: "button") }
    column { |r| link_to('Finish', finish_admin_recording_path(r), method: :post, class: "button") }
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
      f.input :level, as: :radio, collection: ["Audio and Video", "Audio Only"]
      f.input :context, as: :radio, collection: ["Live Performance", "Private Recording Session"]
      f.input :directory
      f.input :cds
      f.input :dvds
    end
    f.actions
  end
end
