module Api
  module V1
    class GamesController < ApplicationController
      respond_to :json
      def index
        respond_with Game.all
      end

      def show
        respond_with Game.find(params[:id])
      end

      def create
        @game = Game.create(game_params)
        respond_with @game do |format|
          format.json { render json: @game.to_json }
        end
      end

      def update
        respond_with Game.update(params[:id], game_params)
      end

      def destroy
       respond_with Game.destroy(params[:id])
      end

      private
      def game_params
       p params
       params.require(:game).permit(:name,:description,:title)
     end
    end
  end
end
