module Api
  class RecordingsController < ApplicationController
    respond_to :json

    def index
      render json: current_user.recordings
    end

    def show
      recording = Recording.find(params[:id])
      return render json: {}, status: 404 unless recording
      if RecordingPolicy.new(current_user, recording).show?
        render json: recording
      else
        render json: {}, status: :unauthorized
      end
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
