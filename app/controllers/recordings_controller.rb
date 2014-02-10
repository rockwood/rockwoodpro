class RecordingsController < ApplicationController
  before_filter :require_login

  expose(:recordings) { current_user.recordings }
  expose(:recording, attributes: :recording_params)

  def create
    if recording.save
      recording.request!
      recording.create_directory
      RecordingMailer.requested(recording).deliver
      User.admins.each do |admin|
        AdminMailer.requested_recording(admin, recording).deliver
      end
      redirect_to app_path, notice: "Thanks! I'll be contacting you soon"
    else
      render :new
    end
  end

  private

  def recording_params
    params.require(:recording).permit!
  end
end