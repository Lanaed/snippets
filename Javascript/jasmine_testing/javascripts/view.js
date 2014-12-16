// write your view code here. use a constructor function!

var View = function(param){
  this.model = param.model
};

View.prototype.renderTree = function() {
  var inhtml = document.querySelector("#orange-tree-template").innerHTML;
  document.querySelector(".grove").innerHTML += inhtml;
};
