get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 @users = User.all
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email params[:email]

  if @user != nil
    if @user.authenticate(params[:password])
     #start sesh
     session[:user_id] = @user.id
     redirect '/'
   else
    redirect '/sessions/new'
  end
else
  redirect '/sessions/new'
end

end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:user_id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  u = User.create(params[:user])
  session[:user_id] = u.id
  redirect '/'
end
