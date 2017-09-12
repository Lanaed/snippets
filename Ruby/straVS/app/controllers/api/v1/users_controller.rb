module Api
  module V1
    class UsersController < ApplicationController

      include StravaPull

      respond_to :json

      def create
        @user = User.create(user_params)
        respond_with @user do |format|
          format.json { render json: @user.to_json }
        end
      end

      def show
        user = User.find(params[:id])
        respond_with get_strava_athlete(user.token)
      end

      def update
        respond_with User.update(params[:id], user_params)
      end

      def destroy
        respond_with User.destroy(params[:id])
      end

      private

      def user_params
        p params
        params.require(:user).permit(:strava_name,:team_id,:token,:refreshtoken)
      end
    end
  end
end
