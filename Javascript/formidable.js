(function() {

/*
Parameters: array
Description: Converts a 2d array of characters to integers and returns array
Returns: the array
*/
function convertToIntegerArray(arr) {
  for (var i = 0; i < arr.length; i++) {
    for (var j = 0; j < arr[i].length; j++) {
      arr[i][j] = parseInt(arr[i][j]); //convert character to integer
    }
  }
  return arr;
}

/*
Parameters: array
Description: Creates a copy of a 2d array using map and slice
Returns: the copy
*/
function copy(currentArr) {
  var newArray = currentArr.map(function(arr) {
    return arr.slice();
  });
  return newArray;
}

/*
Parameters: array
Description: Finds the shortest path through a pyramid of number strings. Uses
dynamic programming approach to build 'optimal triangles' starting from the
second to last row. Keeps track of the path by storing in a mirror array.
Returns: Object with the sum and path array
*/
function smallestPath(arr) {

  var path = copy(arr);
  var sumArray = convertToIntegerArray(arr);

  for (var i = sumArray.length-2; i >= 0; i--) { //for every row starting at 1 from bottom and moving up
    for (var j = 0; j < sumArray[i].length; j++) { //for every cell in that row

      var smallerNum = Math.min(sumArray[i+1][j], sumArray[i+1][j+1]); //determine which child cell is less
      var pathIndex = sumArray[i+1].indexOf(smallerNum,j); //preserve where temp path came from starting at pos j
      sumArray[i][j] += smallerNum; //change sum of total temp path at the index
      path[i][j] += " " + path[i+1][pathIndex]; //update the path array using the prserved index
    }
  }

    //save in answer object
    var answer = {
      sum: sumArray[0][0],
      path: path[0][0].split(" ")
    };

    return answer;
  }

  //********** Driver and test code *********************

  function assert(actual, expected) {
    console.log("*************************************************");
    console.log(actual === expected);
    console.log("Expected " + expected + " and got " + actual );
  }


  var arr1 = [["1"],["2", "3"]];

  var arr2 = [
  ["17"],
  ["51", "29"],
  ["13", "11", "70"],
  ["30", "31", "77", "45"]
  ];

  var test1 = smallestPath(arr1);
  assert(test1.sum, 3);
  assert(test1.path.toString(), [ '1', '2'].toString());

  var test2 = smallestPath(arr2);
  assert(test2.sum, 88);
  assert(test2.path.toString(), [ '17', '29', '11', '31' ].toString());

  //speed check on algorithm

  //create a large pyramid of 1,000 lines
  var arr3 = [];
  for (var i = 0; i < 1000; i++) {
    arr3.push(new Array(i+1));
  }
  for (var i = 0; i < arr3.length; i++) {
    for (var j = 0; j < arr3[i].length; j++) {
      arr3[i][j] = Math.floor((Math.random() * 100) + 1); //fill the cells with a random number 1-100
    }
  }

  console.log("*************************************************");

  //set up a timer
  var beginTime = new Date().getTime();
  // console.log(smallestPath(arr3));
  smallestPath(arr3);
  var endTime = new Date().getTime();
  var time = endTime - beginTime;
  console.log('Total run time of 1000 deep pyramid: ' + time + " milliseconds");

})();