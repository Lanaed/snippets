RATE_LIMIT = 113

before '/api/v1/*' do
  content_type :json
end

get '/api/v1/key' do
  #Key.create()
  Key.create.to_json
end

get '/api/v1/users' do
  User.order(:id).to_json
end

get '/api/v1/articles' do
 Article.order(:id).to_json
end

get '/api/v1/users/:user_id/articles' do
  begin
    User.find(params[:user_id]).articles.order(:id).to_json
  rescue ActiveRecord::RecordNotFound => e
    halt 404, {error: "User not found"}.to_json
  end
end

get '/api/v1/users/:user_id/articles/:article_id/comments' do
  begin
    User.find(params[:user_id]).articles.find(params[:article_id]).comments.to_json
  rescue ActiveRecord::RecordNotFound => e
    halt 404, {details: e.message}.to_json
  end
end


post '/api/v1/users/:user_id/articles' do

  article_params = params[:article] || {}
  begin
    if Key.exists?(key: article_params[:key])
      if User.exists?(id: params[:user_id])
        @article = Article.new(:title => article_params[:title], :body => article_params[:body], :user_id => params[:user_id])
        if Key.where(key: article_params[:key]).first.count < RATE_LIMIT
          if @article.save
            temp = Key.where(key: article_params[:key]).first
            temp.count += 1
            temp.save
            return @article.to_json
          else
            halt 400, {errors: @article.errors}.to_json
          end
        else
          halt 400, {errors: "Key Rate Limit Exceeded"}.to_json
        end
      else
        halt 400, {errors: "That user does not exist!"}.to_json
      end
    else
      halt 400, {errors: "Invalid Key"}.to_json
    end

  rescue ActiveRecord::RecordNotFound => e
    halt 404, {error: "User does not exist"}.to_json
  end
end


post '/api/v1/users/:user_id/articles/:article_id/comments' do
  begin
    comment_params = params[:comment] || {}
    if Key.exists?(key: comment_params[:key])
      if User.exists?(id: params[:user_id])
        if User.find(params[:user_id]).articles.include?(Article.find(params[:article_id]))
          @comment = Comment.new(:body => comment_params[:body], :user_id => params[:user_id], :article_id => params[:article_id])
          if Key.where(key: comment_params[:key]).first.count < RATE_LIMIT
            if @comment.save
              temp = Key.where(key: comment_params[:key]).first
              temp.count += 1
              temp.save
              return @comment.to_json
            else
              halt 400, {errors: @comment.errors}.to_json
            end
          else
            halt 400, {errors: "Key Rate Limit Exceeded"}.to_json
          end
        else
          halt 400, {errors: "Article does not belong to user!"}.to_json
        end
      else
        halt 400, {errors: "That user does not exist!"}.to_json
      end
    else
      halt 400, {errors: "Invalid Key"}.to_json
    end

  rescue ActiveRecord::RecordNotFound => e
    halt 404, {error: "User or Article does not exist"}.to_json
  end
end
