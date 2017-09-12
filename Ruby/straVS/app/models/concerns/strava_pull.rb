require 'active_support/concern'

module StravaPull

  def get_strava_athlete(token)
    user_data   = get_strava_athlete_data(token)
    user        = save_strava_athlete_data(user_data)
    activities  = get_strava_activities(user)
    save_strava_activities(user, activities)
    user
  end

  def get_strava_athlete_data(token)
    p token
    p "here"
    HTTParty.get("https://www.strava.com/api/v3/athlete", headers: {"Authorization" => "Bearer #{token}"})
  end

  def save_strava_athlete_data(strava_data)
    p strava_data.parsed_response["id"]
    # ret.parsed_response["data"]
     p strava_data
    # p response
    user                = User.find_by(strava_id: strava_data.parsed_response["id"])
    p user
    user.firstname      = strava_data.parsed_response["firstname"]
    user.lastname       = strava_data.parsed_response["lastname"]
    user.email          = strava_data.parsed_response["email"]
    user.city           = strava_data.parsed_response["city"]
    user.state          = strava_data.parsed_response["state"]
    user.sex            = strava_data.parsed_response["sex"]
    user.profile_img    = strava_data.parsed_response["profile"]
    user.save

    user
  end

  def get_strava_activities(user)
    now = Date.today
    week_start_unix = now.at_beginning_of_week.to_time.to_i
    week_end_unix   = now.at_end_of_week.to_time.to_i

    query = {}
    temp = HTTParty.get("https://www.strava.com/api/v3/athlete/activities", headers: {"Authorization" => "Bearer #{user.token}"},
                  query: {"after:" => "#{week_start_unix}"})
  end

  def save_strava_activities(user, activities)
    p 'HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    p "*" * 50
    p activities.parsed_response.count
    mon = activities.parsed_response
    mon.each do |activity|
      date_of_activity = DateTime.parse(activity["start_date"])
      if user.activities.last.id == nil || #######################################
        user.activities.create(map_polyline: activity["map"]["summary_polyline"], distance: activity["distance"], date_of_activity: date_of_activity)
      end
    end
    p user.activities
  end
end
