class GamesController < ApplicationController

  def index

    @placeholder = 'placeholder'
    @arr =["one","two","three","four"]

    # @current_user_id = 1 #_strava_session

    #get current user
    @user = User.find(session[:current_user_id])
    #get users team
    @team = @user.team_id

    #get the game that that team is currently in
    @game = Game.where(:team_id => @team).first || Game.where(:awayteam_id => @team).first
    if @game
        #find both teams (for safety) from that game
        @home_team = Team.find(@game.team_id)
        @away_team = Team.find(@game.awayteam_id)

        #save the users as variables
        @home_team_users = @home_team.users
        @away_team_users = @away_team.users

        #Find the total distance for that team
        @home_total = 0
        @home_activities = []
        @home_team_users.each do |player|
          player.activities.each do |activity|
            unless activity.date_of_activity < @game.created_at
                @home_total += activity.distance
                @home_activities << activity
            end
          end
        end

        @home_activities.sort_by! { |activity| activity.date_of_activity }.reverse!

        @away_total = 0
        @away_activities = []
        @away_team_users.each do |player|
          player.activities.each do |activity|
            unless activity.date_of_activity < @game.created_at
                @away_total += activity.distance
                @away_activities << activity
            end
          end
        end

        @away_activities.sort_by! { |activity| activity.date_of_activity }.reverse!


        @end_time = @game.created_at + 7.days
    end

    render :index
  end

end
