// $(document).ready(function() {

//   $('#roller button.add').on('click', function() {
//     console.log("WAT")
//     $('.dice').append('<div class="die">0</div>');
//   });

//   $('#roller button.roll').on('click', function() {
//     $('.die').each(function(k, die) {
//       var value = Math.floor((Math.random()*6)+1);
//       $(die).text(value);
//     });
//   });
// });


//******** Model ************
var Die = function() {}
Die.prototype.new_roll = function(k, die) {
    var val = Math.floor((Math.random()*6)+1);
    $(die).html(val);
  }

//******** View **************
var View = function() {}
View.prototype.show_die = function() {
  $('.dice').append('<div class="die">0</div>');
}

// ******** Controller **********
var Controller = function() {}
Controller.prototype.add_die = function() {
  var v = new View;
  v.show_die();
}
Controller.prototype.roll_die = function() {
  var die = new Die;
  $('.die').each(die.new_roll);
}

$(document).ready(function() {
  var controller = new Controller();
  $('#roller button.add').on('click', controller.add_die);
  $('#roller button.roll').on('click', controller.roll_die);
});