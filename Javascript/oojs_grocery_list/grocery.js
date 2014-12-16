
$(document).ready(function() {
  var List = function(arrayOfItems) {
    this.list = arrayOfItems;
  };
  List.prototype.addItem = function(item) {
    this.list.push(item);
  };

  var ListItem = function(name, price) {
    this.name = name,
    this.price = price
  };

  var apple = new ListItem("Apple", 0.69);
  var tofu = new ListItem("Tofu", 3.49);
  var granola = new ListItem("Granola", 4.55);
  var flatbread = new ListItem("Flatbread", 6.21);
  var zucchini = new ListItem("Zucchini", 1.22);
  var organicBeef = new ListItem("Organic beef", 12.99);

  our_list = new List([apple, tofu, granola, flatbread, zucchini, organicBeef]);

  function sumTotalCost() {
    var sum = 0;
    $('.list-body .item_price').each(function(index) {
      sum += Number($(this).text());
    });
    $('#total_cost').text(sum.toFixed(2));
  }

  function populateList(new_list) {
    var tableString = "";
    for(var i = 0; i < new_list.length; i++) {
      tableString += '<tr class="item"><td class="item_name">' + new_list[i].name + '</td><td class="item_price">' + new_list[i].price + '</td></tr>';
    }
    return tableString;
  };

  $('#store_list').html(populateList(our_list.list));
  $('.list_body').sortable({
    revert:true
  });

  $('.item').draggable({
    connectToSortable: "#grocery_list",
    helper: "clone",
    revert: "invalid",
    start: function(event) {
      element = $(event.target).clone();
    }
  });

  $('#grocery_list').droppable({
    accept: '.item',
    drop: function() {
      $('.list-body').append(element);
      sumTotalCost();
    }
  });
});
