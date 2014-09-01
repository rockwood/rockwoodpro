ActiveAdmin.register Recording do
  config.sort_order = "datetime_desc"

  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :confirm do
    @recording = Recording.find(params[:id])
  end

  member_action :process_confirmed, method: :post do
    recording = Recording.find(params[:id])
    recording.confirm!
    if params[:email][:deliver]
      RecordingMailer.confirmed(recording, params[:email][:comments]).deliver
    end
    redirect_to action: :index
  end

  member_action :finish do
    @recording = Recording.find(params[:id])
  end

  member_action :process_finished, method: :post do
    recording = Recording.find(params[:id])
    recording.finish!
    if params[:email][:deliver]
      RecordingMailer.finished(recording, params[:email][:comments]).deliver
    end
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
    column { |r| link_to('Confirm', confirm_admin_recording_path(r), class: "button") }
    column { |r| link_to('Finish', finish_admin_recording_path(r), class: "button") }
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
          t.column(:file_url) do |obj|
            link_to obj.file_url, obj.file_url
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
