require 'httparty'
require 'uri'
class UsersController < ApplicationController
  def welcome
     render :welcome
  end
  # def stravacallback
  #   # p params
  #   @code=params["code"];
  #   redirect_to  strava_auth
  # end
  def strava_auth
    @code=params["code"];
     @response_temp=HTTParty.post("https://www.strava.com/oauth/token",:body=>{
    :client_id => ENV['CLIENT_ID'],
    :client_secret => ENV['CLIENT_SECRET'],
    :code=>@code
    }.to_json,
    :headers => {'Content-Type'=>'application/json'})
    p @response_temp
    access_token=@response_temp.parsed_response["access_token"]
    @user=User.find_by_token(access_token)
    if !@user
    # @user=User.find_or_create_by(:token=>access_token)
      @user= User.new
      p @user.token          = @response_temp.parsed_response["access_token"]
      p @user.strava_id      = @response_temp.parsed_response["athlete"]["id"]
      p @user.firstname      = @response_temp.parsed_response["athlete"]["firstname"]
      p @user.lastname       = @response_temp.parsed_response["athlete"]["lastname"]
      p @user.email          = @response_temp.parsed_response["athlete"]["email"]
      p @user.city           = @response_temp.parsed_response["athlete"]["city"]
      p @user.state          = @response_temp.parsed_response["athlete"]["state"]
      p @user.sex            = @response_temp.parsed_response["athlete"]["sex"]
      p @user.profile_img    = @response_temp.parsed_response["athlete"]["profile"]
      @user.save
    end
    session[:current_user_id] = @user.id
    p session[:current_user_id]
    redirect_to action: "show", id:@user.id
  end
  def index
    render :index
  end

  def show
    @user = User.find(session[:current_user_id])

    if @user.team
      @team = @user.team
      @all_team_members = @team.users
      @teammates = @team.users.where.not(:id=> @user[:id])

      @team_chats = []
      @all_team_members.each do |person|
        person.team_chats.each do |chat|
          @team_chats << chat
        end
      end
      @team_chats = @team_chats.sort_by { |chat| chat.updated_at }.reverse!
    end



    render :show


    # Logic to pull the strava api
    # Find user and get the game through the team
    # if they are not registered with the team then pull only user data
    # if they are not registered with a game pull only the teams data
    # get 8 users id and token into array
    # pull one by one
    # if the user dont have an activity then create one
    # else get the id of the last activity from db get the
    # activity table  activityid and check if it incoming response/(s) id
    # is greater than activiy id



    #if the user does not have a team pull only the user data from Strava
    now=Date.today
    p week_start_unix = now.at_beginning_of_week.to_time.to_i
    google_uri_builder = 'https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:'

    if (!@user.team)
      user_strava_data=HTTParty.get("https://www.strava.com/api/v3/athlete/activities", headers: {"Authorization" => "Bearer #{@user.token}"},query: {:after => week_start_unix})
      p @user.activities.count
      if (@user.activities.count==0)
          user_strava_data.each do |active|
            # p "ere"
            # p @user.activities
            # p active
            act= @user.activities.new
            # p @user.activities.last.activityid
            # p  active["id"]
            if  active["id"]>@user.activities.last.activityid
              act.activityid= active["id"]
              act.user_id= @user.id
              act.map_polyline= URI.escape(google_uri_builder + active["map"]["summary_polyline"] + "&key=#{ENV['GOOGLEAPI']}")
              act.distance= active["distance"]
              act.save
            end
            p @user.activities.last
          end
      else
         p user_strava_data
          user_strava_data.each do |active|
            p "in the else before the user act. count"
             p @user.activities.count
               if (active["id"]>@user.activities.last.activityid )
                 @user.activities.create(activityid: active["id"] ,user_id: @user.id,map_polyline: URI.escape(google_uri_builder + active["map"]["summary_polyline"] + "&key=#{ENV['GOOGLEAPI']}"), distance: active["distance"])
               end
          end
        end

    end

    # if the user does have a team but does not in a game

    # u=User.find(params[:id])

    # t=u.team.games.pluck(:team_id,:awayteam_id)
    # users=[]
    # t.flatten.each { |tid|  users << Team.find(tid).users }
    # tokens=[]
    # users.each { |user | tokens << user.pluck(:token,:id)}

    # p tokens
    # tokens.each do |token|
    #   token.each do |item|
    #  tempm=HTTParty.get("https://www.strava.com/api/v3/athlete/activities", headers: {"Authorization" => "Bearer #{item[0]}"},query: {:after => week_start_unix})
    #   tempm.parsed_response.each do | active|
    #     user=User.find(item[1])
    #     p "acitivyt id "
    #     user.activities
    #     p user.activities.last.activityid
    #     lat= user.activities.last
    #     if (lat==nil)
    #       user.activities.create(activityid: active["id"] ,user_id: user.id,map_polyline: active["map"]["summary_polyline"], distance: active["distance"])
    #     end
    #     if (active["id"]>lat.activityid )
    #        user.activities.create(activityid: active["id"] ,user_id: user.id,map_polyline: active["map"]["summary_polyline"], distance: active["distance"])
    #        end
    #       end
    #     end
    #   p "here"
    # end
  end
end
