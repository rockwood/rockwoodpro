module Api
  class RecordingsController < ApplicationController
    respond_to :json

    def index
      if params[:demo].present?
        render json: Recording.where(demo: true)
      else
        render json: current_user.recordings
      end
    end

    def show
      recording = Recording.find(params[:id])
      authorize recording
      render json: recording
    end

    def create
      recording = current_user.recordings.new(recording_params)
      if recording.save
        recording.request!
        RecordingMailer.requested(recording).deliver_now
        AdminMailer.requested_recording(User.admins, recording).deliver_now
        render json: recording
      else
        render json: { errors: recording.errors }, status: :unprocessable_entity
      end
    end

    def update
      recording = current_user.recordings.find(params[:id])
      if recording.update(recording_params)
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
