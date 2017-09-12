module Api
  module V1
    class TeamsController < ApplicationController
      respond_to :json

      def index
        respond_with Team.all
      end
      def show
        respond_with Team.find(params[:id])
      end

      def create
        @team = Team.create(team_params)
        respond_with @team do |format|
          format.json { render json: @team.to_json }
        end
      end
      def update
        respond_with Team.update(params[:id], team_params)
      end
      def destroy
       respond_with Team.destroy(params[:id])
      end

      private
      def team_params
       p params
       params.require(:team).permit(:name,:description,:location)
     end
   end
 end
end
