class RecordingsController < ApplicationController
  before_filter :require_login

  expose(:recordings) { current_user.recordings }
  expose(:recording, attributes: :recording_params)

  def create
    if recording.save
      recording.request!
      RecordingMailer.requested(recording).deliver
      AdminMailer.requested_recording(User.admins, recording).deliver
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
