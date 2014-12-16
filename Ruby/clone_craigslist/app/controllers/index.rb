get '/' do

  @categories = Category.all

  erb :index

end

get '/categories' do
  # Look in app/views/index.xzdxcz cerb
  @categories = Category.all
  erb :categories
end

get '/articles' do
  @articles = Article.all
  erb :articles
end

get '/category/:category_id' do
  @category = Category.find(params["category_id"])
  erb :category
end

get '/category/:category_id/:article_id' do
  @article = Article.find(params[:article_id])
  erb :article
end

#add articles
get '/article/new' do
  erb :new
end

post '/article' do

#create the new article
new_article = Article.create(title: params[:title], price: params[:price], description: params[:description], category_id: params[:categories])
new_article.get_secret_key
new_article.save
  redirect '/articles'
end

get '/article/edit/:unique' do
  @article = Article.find_by(key: params[:unique])
  erb :edit
end

put '/category/:category_id/:article_id' do
  a = Article.find(params[:article_id])
  a.category_id = params[:categories]
  a.title = params[:title]
  a.price = params[:price]
  a.description = params[:description]
  a.save
  redirect '/'
end







