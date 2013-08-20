module Api
  class PiecesController < ApplicationController
    before_filter :require_login
    respond_to :json

    expose(:pieces) { current_user.pieces }
    expose(:piece)

    def index
      respond_with(pieces)
    end

    def show
      respond_with(piece)
    end
  end
end