get '/' do
  @notes = Note.all
  erb :index
end

get '/add' do
  erb :add
end

post '/add' do
  Note.create(:title => params[:title], :content => params[:content])
  redirect '/'
end

get '/update/:note_id' do
  @note_for_update = Note.find(params[:note_id])
  erb :update
end

put '/update/:note_id' do
  n = Note.find(params[:note_id])
  n.title = params[:title]
  n.content = params[:content]
  n.save
  redirect '/'
end

get '/delete/:note_id' do
  @note_for_delete = Note.find(params[:note_id])
  erb :delete
end

delete '/delete/:note_id' do
  Note.find(params[:note_id]).destroy
  redirect '/'
end

get '/:noteid' do
  @note = Note.find(params[:noteid])
  erb :note
end