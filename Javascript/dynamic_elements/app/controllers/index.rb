get '/' do
  # Look in app/views/index.erb
  @list = Todo.all
  erb :index
end

post '/todos' do
  todo = Todo.create(:todo_content => params[:content])
  content_type :json
  todo.to_json
end

#put complete
put '/todos/:id' do
  t = Todo.find(params[:id])
  t.completed = true
  t.save
end

#delete
delete '/todos/:id' do
  todo = Todo.find(params[:id]);
  todo.destroy
end



