class RecordingsController < ApplicationController
  before_filter :require_login

  expose(:recordings) { current_user.recordings }
  expose(:recording, attributes: :recording_params)

  def create
    if recording.save
      redirect_to recordings_path, notice: "Thanks! I'll be contacting you soon"
    else
      render :new
    end
  end

  private

  def recording_params
    params.require(:recording).permit!
  end
end