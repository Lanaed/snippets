class TeamsController < ApplicationController

  def index
    if params[:query].present?

      @teams = Team.where("name LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @teams = Team.all
    end

    render :index
  end
end
