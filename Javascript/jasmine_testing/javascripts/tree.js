// write your tree code here. use a constructor function!
FRUIT_BEARING_AGE = 5;
MAX_AGE = 50;

var Tree = function (){
  this.age = 0;
  this.height = 0;
  this.orangeCount = 0;
  this.isAlive = true;
};

Tree.prototype.grow = function() {
  this.age += 1;
  this.height += 10;
  if (this.age >= FRUIT_BEARING_AGE) {
    this.orangeCount += Math.floor((Math.random() * 10) + 1);
  }
  if (this.age > MAX_AGE) {
    this.isAlive = false;
  }
};

Tree.prototype.dropOrange = function() {
  this.orangeCount -= 1
  return this.orangeCount;
};

Tree.prototype.pickOrange = function() {
    var make_orange = function() {
      return {
        diameter: Math.floor((Math.random() * 3) + 1)
      }
    }
    var orange = make_orange();
    return orange;
};
