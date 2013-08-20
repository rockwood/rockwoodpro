module Api
  class RecordingsController < ApplicationController
    before_filter :require_login
    respond_to :json

    expose(:recordings) { current_user.recordings }
    expose(:recording, attributes: :recording_params)

    def index
      respond_with(recordings)
    end

    def show
      respond_with(recording)
    end
  end
end