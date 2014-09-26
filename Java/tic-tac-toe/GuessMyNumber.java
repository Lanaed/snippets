

import java.util.Random;
import java.util.Scanner;

public class GuessMyNumber {
	
	public static void main(String[] args) {
		GuessMyNumber.play();
	}
	
	public static void play() {

		boolean replay = false;						//sets a boolean condition for entire game replay loop, starts loop 1
		int yesOrNo;								//variable yesOrNo created for input from user the entire game loop
		Scanner input = new Scanner(System.in);		//scanner input for program

		while (replay == false) {					//This creates a loop for the entire program, so the user can play without restarting if they choose

			//my variables for guessing game
			Random rand = new Random();					//defines rand a random number using a java import
			int correctGuess = 1 + rand.nextInt(52);	//defines correctGuess as the randomly generated integer from 1 and 52 (1 + (0-51))

			int numberOfAttempts = 0;					//defines a new integer with the number of tries a user has, set to 0 to start since they haven't guessed
			boolean gameOver = false;					//defines a new boolean that signifies the game is over if true, loops if false
			int guess;									//new variable for the users guess
			int high = 52;								//sets the upper bound for the range of guesses prompts
			int low = 1;								//sets the lower bound for the range of guesses prompts

			System.out.println("Hi there! You have 5 chances to guess the number I am thinking of. I'll give you a hint, its between 1 and 52..."); 	//prompts user with game goal
			System.out.println("Please print your first guess below:");

			while (gameOver == false) {		//sets the loop conditions of when the game ends; either when they guess correctly or guess incorrectly 5 times

				while (!input.hasNextInt()) {												//So if users input anything but integers, the program wont crash (hasNextInt from Java website)
					input.next();
					System.out.println("That was not an integer, guess again");
				}

				guess = input.nextInt();		//prompts a space for input, sets variable to guess as whatever the user of the program guesses
				numberOfAttempts++;				//increases the number of guesses by 1 after the user guesses

				if (guess == correctGuess) {															//conditional statement when the user guesses the correct number
					gameOver = true;																	//exits loop
					System.out.println("You win! ");													//prints they win!
					System.out.println("The number was " + correctGuess);								//prints the randomly chosen correct number
					System.out.println("It took you " + numberOfAttempts + " attempts");				//tells the user their total attempts or guesses
					System.out.println("Do you wish to replay? type below 1 to replay or 2 to stop playing");	//prompts play again question
				}

				else if (numberOfAttempts >= 5) {														//conditional for if they choose 5 or more
					gameOver = true;																	//exits loop
					System.out.println("You lose, you had 5 incorrect guesses!");						//prints out that the user loses the game
					System.out.println("The number was: " + correctGuess);
					System.out.println("Do you wish to replay? type below 1 to replay or 2 to stop playing"); 	//prompts play again question
				}

				else if (guess > correctGuess) {														//conditional statement when user guesses too high
					if (guess < high) { 																//conditional for making sure they guessed in advised range
						high = guess - 1; 																//sets up new range
					}
					else if (guess > high) {															//if they didn't guess in the right range
						System.out.println("That was a wasted guess, you didnt guess in the range!");
					}

					System.out.print("Your guess is too high, please choose another number, ");			//user is prompted with this and loop is restarted
					System.out.println("this time in the range " + low + " - " + high + ".");			//displays the new range of values to guess from
					System.out.println("Please print your next guess below");
				}

				else if (guess < correctGuess) {														//conditional statement when user guesses to low
					if (guess > low) {																	//conditional for making sure they guessed in the advised range
						low = guess + 1; 																//sets up new range
					}
					else if (guess < low) {																//if they did't guess in the right range
						System.out.println("That was a wasted guess, you didn't guess in the range!");
					}

					System.out.print("Your guess is too low, please choose another number, ");			//user is prompted with this and loop is restarted
					System.out.println("this time in the range " + low + " - " + high + ".");			//displays the new range of values to guess from
					System.out.println("Please print your next guess below:");
				}

			}		//end bracket of loop 2

			//Two while loops to protect against non integer and non(1,2) values
			while (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid selection");
			}
			yesOrNo = input.nextInt();	
			while (yesOrNo != 1 && yesOrNo !=2) {
				System.out.println("Thats not a valid selection");
				yesOrNo = input.nextInt();
			}
			if (yesOrNo == 2) {										
				replay = true;										
			}
			else if (yesOrNo == 1) {								
				System.out.println("Ok, here we go again!");		
			}	

		}	//end bracket of loop 1

	}	//main method
	
}	//class

