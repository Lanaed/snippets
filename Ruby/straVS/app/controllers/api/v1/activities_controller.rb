module Api
  module V1
    class ActivitiesController < ApplicationController
      respond_to :json
      def index
        respond_with Activity.all
      end

      def show
        respond_with Activity.find(params[:id])
      end

      def create
        @activity = Activity.create(activity_params)
        respond_with @activity do |format|
          format.json { render json: @activity.to_json }
        end
      end

      def update
        respond_with Activity.update(params[:id], activity_params)
      end

      def destroy
        respond_with Activity.destroy(params[:id])
      end

      private

      def activity_params
        params.require(:activity).permit(:map_polyline,:distance,:date_of_activity)
     end
    end
  end
end
