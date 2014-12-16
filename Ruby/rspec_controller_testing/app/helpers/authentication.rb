helpers do
  def authenticate_session
    session[:user_id] ? User.find(session[:user_id]) : false
  
  rescue ActiveRecord::RecordNotFound
    false
  end
end