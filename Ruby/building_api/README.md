# ROUTES

[GET] API key
/api/v1/key

[GET] list of users
/api/v1/users

[GET] list of articles
/api/v1/articles

[GET] list of articles for a user
/api/v1/users/:user_id/articles

[GET] list of comments for an article by a user
/api/v1/users/:user_id/articles/:article_id/comments

[POST] create a new article by a user
/api/v1/users/:user_id/articles
params: article[title], article[body], article[key]

[POST] create a new comment for an article by a user
/api/v1/users/:user_id/articles/:article_id/comments
params: comment[body], comment[key]

