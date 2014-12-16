$(document).ready(function() {

  var Tweet = function(obj) {
    this.handle = obj["handle"];
    this.content = obj["content"];
    this.avatar_url = obj["avatar_url"];
    this.created_at = obj["created_at"];
    this.hashtag_names = obj["hashtag_names"];
  }

  function create_tweets(data) {
    tweets = [];
    for(var i = 0; i < data.length; i++) {
      tweets.push(new Tweet(data[i]))
    }
    return tweets;
  }

  function build_tweet_html(tweets) {
    console.log("got here");
    for(var i = 0; i < tweets.length; i++) {
      for(var j = 0; j < tweets[i].hashtag_names.length; j++) {
        tweets[i].hashtag_names[j] = "#" + tweets[i].hashtag_names[j];
      }
      hashtag_names = tweets[i].hashtag_names.toString().replace(/,/g , " ");
      $('#tweets-container ul').append('<li class="tweet"><img class="avatar" src="'+tweets[i].avatar_url+'" alt=""><div class="tweet-content"><p><span class="username">'+tweets[i].handle+'</span><span class="timestamp">'+tweets[i].created_at+'</span></p><p>'+tweets[i].content + hashtag_names +'</p></div></li>');
    }
  }

  $.ajax({
   url: '/tweets/recent',
   type: 'get',
 })
  .done(function(server_data) {
    console.log("got some data back");
    tweets = create_tweets(server_data);
    // console.log(tweets);
    build_tweet_html(tweets);
  })
  .fail(function() {
   console.log("failed to get data");
 })




})
