get '/widgets' do
  current_user = authenticate_session
  if current_user
    @widgets = current_user.widgets
  else
    @widgets = Widget.all
  end

  erb :'widgets/index'
end
