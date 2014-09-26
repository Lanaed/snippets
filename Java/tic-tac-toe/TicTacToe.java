import java.util.Scanner;


public class TicTacToe {

	public static void main(String[] args) {
		TicTacToe.play();
	}

	public static void play() {
		boolean keepPlaying = true;		//sets a boolean condition for entire game replay loop, starts loop 1
		Scanner input = new Scanner(System.in);		//scanner input for program
		int yesOrNo;
		while (keepPlaying) {
			Scanner input2 = new Scanner(System.in);
			System.out.println("What do you want to call this game?");
			String gameTitle = input2.next();

			Board myBoard = new Board(gameTitle);
			System.out.println("Ok, the game is called: " + myBoard.getTitle());

			//tell player who is X and who is O
			int[] move;
			String display;
			//creating a loop around game until it ends
			while (!myBoard.isGameDone()) {

				//Display the board
				display = myBoard.currentBoard();
				System.out.println(display);

				//Prompt P1
				System.out.println("Player 1's turn. Enter your move.");

				//Take location entered, protect against input
				move = myBoard.getLegalMove();

				//Update board: Place X at player's desired location
				myBoard.setElement(move[0], move[1], "X");

				//if game is done, stop
				if (myBoard.isGameDone()) {
					break;
				}

				//Print Board, Prompt P2
				display = myBoard.currentBoard();
				System.out.println(display);
				System.out.println("Player 2's turn. Enter your move.");

				//Get P2 location
				move = myBoard.getLegalMove();

				//Update board
				myBoard.setElement(move[0], move[1], "O");
			}

			System.out.println("Game Over!");
			System.out.println(myBoard.currentBoard());

			if (myBoard.isWinner("X")) {
				System.out.println("Player 1 is the winner!");
			}
			else if (myBoard.isWinner("O")) {
				System.out.println("Player 2 is the winner!");
			}
			else {
				System.out.println("It was a draw!");
			}

			System.out.println("Do you wish to replay? Type Q to quit, anything else to replay"); 	//prompts play again question
			if (input.next().equals("Q")) {
				keepPlaying = false;
				break;
			}							
			System.out.println("Ok, here we go again!");
		}
	}
}
