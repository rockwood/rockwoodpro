module Api
  class PiecesController < ApplicationController
    before_filter :require_login

    def index
      render json: current_user.pieces 
    end

    def show
      piece = Piece.find(params[:id])
      render json: piece
    end

    def update
      piece = Piece.find(params[:id])      
      authorize piece
      if piece.update(piece_params)
        render json: piece
      else
        render json: piece.errors, status: :unprocessable_entity
      end
    end

    private

    def piece_params
      params.require(:piece).permit(:shared)
    end
  end
end
