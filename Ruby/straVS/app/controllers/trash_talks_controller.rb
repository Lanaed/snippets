class TrashTalksController < ApplicationController

  respond_to :json

  def create
    # p params["team_chat"]
     #get current user
    # user = User.find(session[:current_user_id])
    # #get users team
    # team = user.team_id

    # #get the game that that team is currently in
    # game = Game.where(:team_id => team).first || Game.where(:awayteam_id => team).first
    # p game.id
    trashtalk=TrashTalk.create(trash_talk_params)

    respond_to do |format|
      format.json{ render :json => trashtalk.to_json(:include => :user) }
      end
  end

  private

  def trash_talk_params
    params.require(:trash_talk).permit(:content,:user_id,:game_id)

  end
end
