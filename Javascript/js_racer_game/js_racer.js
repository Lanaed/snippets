window.addEventListener("load", function(){

  size_prompt();

  function size_prompt() {
    var n = prompt(" Enter the size of the board", "Type your number here");
    createBoard(n);
  }

  function createBoard(size) {
    document.getElementById("player1_strip").innerHTML= "<td class='active'></td>";
    document.getElementById("player2_strip").innerHTML = "<td class='active'></td>";
    for (var i = 0; i < size-1; i++) {
      document.getElementById("player1_strip").innerHTML += "<td></td>";
      document.getElementById("player2_strip").innerHTML += "<td></td>";
    }
  }

  window.addEventListener('keypress', checkKeyPressed, false);

  var player1 = document.getElementById("player1_strip");
  var player2 = document.getElementById("player2_strip");

  function checkKeyPressed(key_pressed) {
    if (key_pressed.charCode == '113') {
      playerMove(player1);
    }
    if (key_pressed.charCode == '112') {
      playerMove(player2);
    }
  }

  function winner(player) {
    if (player.cells[player.cells.length - 1].className == 'active') {
      alert(" Winner!");
      resetBoard();
    }
  }

  function playerMove(player) {
    for(var i = 0; i < player.cells.length-1; i++){
      if (player.cells[i].className == 'active') {
        player.cells[i+1].className = 'active';
        player.cells[i].className = '';
        winner(player);
        break;
      }
    }
  }

  function resetBoard() {
    for (var i = 0; i < player1.cells.length; i++) {
      player1.cells[i].className = "";
      player2.cells[i].className = "";
    }
    player1.cells[0].className = "active";
    player2.cells[0].className = "active";
  }

  var button = document.getElementById('reset');
  button.addEventListener('click' ,resetBoard);

  var button2 = document.getElementById('size');
  button2.addEventListener('click' , size_prompt);


}) //end of window load
