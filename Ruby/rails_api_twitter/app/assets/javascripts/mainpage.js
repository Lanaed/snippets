$(document).ready(function(){

    $.ajax({
      url:"hashtags/popular",
      type: 'get',
      })

      .done(function(server_data){
        for (i = 0; i < server_data.length; i ++){
          $('#trends-list').append("<li>#" + server_data[i] + "</li>")
        }
      })

      .fail(function(){
        console.log("Nope Try Again")
      // setTimeout(trends, 10000);
    })


  $('#search-form').on('submit', function(event) {
    event.preventDefault();
    var input = $(this).find('#search').val();
    console.log(input);

    $.ajax({
      url:'tweets/search/'+ input,
      type:'get',
    })

    .done(function(server_data){
      console.log(server_data);
      build_tweet_html(server_data);
    })

    .fail(function(){
      console.log("Nope Try Again")
      $('#search-form').find('#search').css('background-color', 'red')
    })
  });

}) // End of Page Ready function
