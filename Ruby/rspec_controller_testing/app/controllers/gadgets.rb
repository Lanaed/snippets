get '/gadgets' do
  @gadgets = Gadget.all
  erb :'gadgets/index'
end

post '/gadgets' do
  gadget = Gadget.new(name: params[:name], body: params[:body])

  if gadget.save
    redirect to('/gadgets')
  else
    status 422
  end

end
