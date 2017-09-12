module UsersHelper
  def total_distance(user)
    return 0 if user.activities.length == 0

    activities = user.activities.map { |activity| activity.distance }
    activities.reduce(:+)
  end

  def total_distance_team(user_array)
    return 0 if user_array.length == 0

    totals = []
    user_array.each do |user|
      totals << total_distance(user)
    end
    totals.reduce(:+)
  end
end
