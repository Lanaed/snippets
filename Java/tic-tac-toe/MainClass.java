/*************************************************************************************
 * Program: Assignment4.java
 * Author: Ethan Spiro
 * Due Date: 5/26/13
 *
 *Description: A games client where you can play a guessing number game, a tic tac toe game or quit.
 *
 *Input:Selections of games from user and then in guessing game, integer guesses, and in TicTacToe game coordinate guesses 
 *		for array cells and a prompt for replaying. 
 *
 *Output: Guessing game - the correct number, your guesses, if you got it right or failed. TicTacToe - an updated board 
 *		after each time a user guesses, and then a statement of who wins after the guesses and a prompt for replaying. 
 *
 *************************************************************************************/

import java.util.Scanner;

public class MainClass {

	public static void main(String[] args) {

		boolean replay = false;		//boolean variable for exiting entire program
		Scanner input = new Scanner(System.in);	 //scanner
		int gameSelection;		//int variable for selecting game

		//loop for whole program
		while (replay == false) {

			//menu options
			System.out.println("Please Select a game to Play from the Menu:");	
			System.out.println("[1] Guess and Number between 1 and 52");
			System.out.println("[2] TicTacToe");
			System.out.println("[3] Quit");
			System.out.println("Enter your choice 1, 2 or 3");

			//Two while loops to protect against non integer values and non(1,2,3) values being entered
			while (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid selection");
			}
			gameSelection = input.nextInt();
			while (gameSelection != 1 && gameSelection !=2 && gameSelection !=3) {
				System.out.println("Thats not a valid selection");
				gameSelection = input.nextInt();
			}

			//Guess My Number game is chosen
			if (gameSelection == 1){

				//method play enacted on GuessMyNumber class
				GuessMyNumber.play();
			}

			//TicTacToe game is chosen
			else if (gameSelection ==2) {
				
				//method play enacted on TicTacToe Class
				TicTacToe.play();

			}

			//program exits 
			else {
				replay = true;
			}

		}
	}
}
