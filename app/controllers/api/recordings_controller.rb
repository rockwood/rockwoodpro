module Api
  class RecordingsController < ApplicationController
    before_filter :require_login
    respond_to :json

    def index
      render json: current_user.recordings
    end

    def show
      render json: current_user.recordings.find(params[:id])
    end

    def create
      recording = current_user.recordings.new(recording_params)
      if recording.save
        recording.request!
        RecordingMailer.requested(recording).deliver
        AdminMailer.requested_recording(User.admins, recording).deliver
        render json: recording
      else
        render json: { errors: recording.errors }, status: :unprocessable_entity
      end
    end

    private

    def recording_params
      params.require(:recording).permit!
    end
  end
end
