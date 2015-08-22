ActiveAdmin.register Recording do
  config.sort_order = "datetime_desc"

  preserve_default_filters!
  filter :user, collection: User.order('last_name')

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
    if params[:email][:deliver] == "1"
      RecordingMailer.confirmed(recording, params[:email][:comments]).deliver_now
    end
    redirect_to action: :index, notice: "Recording confirmed"
  end

  member_action :finish do
    @recording = Recording.find(params[:id])
  end

  member_action :process_finished, method: :post do
    recording = Recording.find(params[:id])
    recording.finish!
    if params[:email][:deliver] == "1"
      RecordingMailer.finished(recording, params[:email][:comments]).deliver_now
    end
    redirect_to action: :index, notice: "Recording finsihed"
  end

  member_action :discover, method: :post do
    recording = Recording.find(params[:id])
    recording.discover_pieces
    redirect_to action: :show
  end

  action_item :discover_pieces_link, only: :show do
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
    column :duration
    column :cds
    column :dvds
    column :pieces do |recording|
      recording.pieces.count
    end
    column :live_stream
    column :state do |recording|
      status_tag(recording.state, color_for_state(recording.state))
    end
    column do |recording|
      if recording.requested?
        link_to('Confirm', confirm_admin_recording_path(recording), class: "button")
      elsif recording.confirmed?
        link_to('Finish', finish_admin_recording_path(recording), class: "button")
      end
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
      row :duration
      row :cds
      row :dvds
      row :demo
      row :embed_code
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
      f.input :user, collection: User.order('last_name')
      f.input :datetime, :ampm => true
      f.input :location
      f.input :level, as: :radio, collection: ["Multi Camera", "Single Camera", "Audio Only"]
      f.input :context, as: :radio, collection: ["Live Performance", "Private Recording Session"]
      f.input :state, as: :radio, collection: Recording.aasm.states.map { |s|
        [s.name, s.name, checked: recording.state == s.name.to_s]
      }
      f.input :duration
      f.input :directory
      f.input :cds
      f.input :dvds
      f.input :live_stream
      f.input :embed_code
      f.input :demo
    end
    f.actions
  end
end
