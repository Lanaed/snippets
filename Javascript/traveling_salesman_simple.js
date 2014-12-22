
var MAXCITIES = 10;

//map to store all the cityNode objects
var map = [];

//salesman object
var salesman = {
  name: "Boris",
  age: 40,
  totalDistance: 0,
  curCity: 0,
  citiesVisited: [],
  citiesNotVisited: []
};

//function for dynamically creating cityNodes
function cityNode(id, x_coord, y_coord) {
  this.id = id,
  this.x_coord = x_coord,
  this.y_coord = y_coord
}

//function for initializing the map
function initCities() {

  //create 10 cityNode objects and store in the map array
  for (var i = 0; i < MAXCITIES; i++) {

    var newCity = new cityNode();
    newCity.id = i;
    newCity.x_coord = Math.random()*10 + 10;
    newCity.y_coord = Math.random()*10 + 10;

    //add the new node to the map!
    map.push(newCity);
  }
}

//x2, x1, y2, y1 using that old formula from high school math
function calcDistance(a,b,c,d) {

  //distance = square root ((a-b)^2 + (c-d)^2)
  return Math.sqrt(Math.pow((a-b),2) + Math.pow((c-d),2));

}

//shows current tour of your salesman
function showtour(salesObject) {
  console.log("Your current tour is:");
  for (var i = 0; i < salesObject.citiesVisited.length; i++) {
    console.log("City: " + salesObject.citiesVisited[i].id);
  }
  console.log("Total Distance: " + salesObject.totalDistance);
}

//my main function which automates the game for now
function gameplay() {

  //push all cities into not visited array for salesman
  for (var i = 0; i < MAXCITIES; i++) {
    salesman.citiesNotVisited.push(map[i]);
  }

  //push initial city 1 onto map and remove from notVisited array
  salesman.citiesVisited.push(map[0]);
  salesman.curCity = 0;
  salesman.citiesNotVisited.pop(map[0]);
  showtour(salesman);

//while there are still cities to visit
while (salesman.citiesNotVisited.length != 0) {

  //update current city
  salesman.curCity++;

  //transfer next city from notVisted to visited
  salesman.citiesVisited.push(map[salesman.curCity]);
  salesman.citiesNotVisited.pop(map[salesman.curCity]);

  //add the ditance between the points to total tour length
  salesman.totalDistance += calcDistance(map[salesman.curCity].x_coord, map[salesman.curCity - 1].x_coord, map[salesman.curCity].y_coord, map[salesman.curCity - 1].y_coord);
  showtour(salesman);
}

console.log("Congrats tour finished!");
}

//main code for running:
initCities();
gameplay();
