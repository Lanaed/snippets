$(document).ready(function() {
  bindEvents();
});


function bindEvents() {
  $('#frm').on('submit', addTodo);
  $('.delete').on('submit', deleteTodo);
  $('.complete').on('submit', completeTodo);
}


function buildTodo(todoName) {
  // gets todoTemplate stored in DOM.
  var todoTemplate = $.trim($('#todo_template').html());
  // Creates an jQueryDOMElement from the todoTemplate.
  var $todo = $(todoTemplate);
  // Modifies it's text to use the passed in todoName.
  $todo.find('h2').text(todoName);
  // Returns the jQueryDOMElement to be used elsewhere.
  return $todo;
}

  //~~~~~~~~~~~~~ Adding a todo ~~~~~~~~~~~~~~
  function addTodo(e) {
    e.preventDefault();
    var the_data = $(this).serialize();
    $.ajax({
      url: '/todos',
      type: 'post',
      data: the_data
    })
    .done(function(server_data) {
      var new_content = (server_data.todo.todo_content);
      $new_todo = buildTodo(new_content);
      $new_todo.find('.delete').attr("href", "/todos/"+server_data.todo.id);
      $new_todo.find('.complete').attr("href", "/todos/"+server_data.todo.id);
      $new_todo.appendTo(".todo_list");
    })
    .fail(function() {
      console.log("f'ed up");
    })
  }

    //~~~~~~~~~~~~~ Deleting a todo ~~~~~~~~~~~~~~
    function deleteTodo(e) {
      e.preventDefault();
      delete_button = this;
      $.ajax({
        url: this.action,
        type: 'delete'
      })
      .done(function(server_data) {
        delete_button.parentElement.remove();
      })
      .fail(function() {
        console.log("f'ed up");
      })
    }

    //~~~~~~~~~~~~~ Updating a todo ~~~~~~~~~~~~~~
    function completeTodo(e) {
      e.preventDefault();
      var $todo = $(this).parents().filter(".todo");
      $.ajax({
        url: this.action,
        type: 'put'
      })
      .done(function(server_data) {
        $todo.addClass('complete');
      })
      .fail(function() {
        console.log("f'ed up");
      })
    }
