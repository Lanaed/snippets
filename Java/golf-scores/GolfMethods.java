import java.awt.List;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class GolfMethods {

	/**
	 * The default constructor
	 */
	public GolfMethods() {	
	}

	/**
	 * Determines the amount of holes the golfers want to play for their game. Asks for the input with a scanner 
	 * called input and checks to male sure the number of holes is between 1 and 18
	 * @param holes variable initially set to zero
	 * @return the number of holes the user chooses
	 */
	public int getHoles(int holes) {
		Scanner input = new Scanner(System.in);
		boolean validEntry = false;
		System.out.println("How many holes would you like to play today (1-18)?");
		while(validEntry == false) {
			if (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid number of Holes");
			}
			else if(input.hasNextInt()) {
				holes = input.nextInt();
				if(holes > 0 && holes < 19) {
					validEntry = true;
				}
				else 
					System.out.println("Sorry you must choose 1-18 holes");
			}
		}
		return holes;

	}

	/**
	 * Determines the amount of golfers playing this round. Asks for the input with a scanner called input. This
	 * is protected to make sure they enter and integer that is between 1 and 8.
	 * @return the number of golfers playing the round. 
	 */
	public int getGolfers() {
		Scanner input = new Scanner(System.in);
		int number_golfers = 0;
		boolean validEntry = false;
		System.out.println("How many people will be golfing today (1-8)?");
		while(validEntry == false) {
			if (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid number of golfers");
			}
			else if(input.hasNextInt()) {
				number_golfers = input.nextInt();
				if(number_golfers > 0 && number_golfers < 9) {
					validEntry = true;
				}
				else 
					System.out.println("Sorry the course requires 1-8 golfers");
			}
		}
		return number_golfers;
	}

	/**
	 * This method writes the course information, i.e. the par per hole to a file called par.txt. The method 
	 * uses the number of holes the user wishes to play and a random number generator (generates values 3 - 7)
	 * to write the par.txt file. Each line in the par.txt file represents a hole, and the number on each line
	 * represents par for that hole.
	 * @param courseLength the number of holes the user wanted to play
	 */
	public void writeCourseFile(int courseLength) {

		String coursePar = "par.txt";

		try {
			//creating new PrintStream object and passing the file name "par.txt"
			PrintStream myFileWriter = new PrintStream(coursePar);
			Random rand = new Random(); 

			//generating and writing a random number per line (3 to 6) 18 times to fill out the par file for course
			for(int i = 0; i < courseLength; i++)
				myFileWriter.println(rand.nextInt(4) + 3);

			//close input to avoid potential memory leaks
			if(myFileWriter != null) {
				myFileWriter.close();
			}

		}
		//catches file not found error
		catch(FileNotFoundException e) {
			System.out.println("File not found, please try a different name");
		}

	}

	/**
	 * This method simulates the players actually playing the game by writing a scores file that the user names.
	 * Once the user inputs a name, that name is used to create a new PrintStream object. In a real game of golf
	 * the user would be writing this file as they go, but in my program I generate the file. I generate the file
	 * by using a random number generator (using the imported java Random class) to generate numbers between 1 and
	 * 8 to simulate players scores on each hole. I also make sure to only write the file that matches the holes
	 * they want to play and the number of players playing by passing those parameters into the method. The score
	 * file prints the number of players on the first line, and then following on consecutive lines, the players 
	 * scores.
	 * @param numberOfPlayers the number of players as determined by user
	 * @param courseLength the course length as determined by user
	 */
	public void writeScoresFile(int numberOfPlayers, int courseLength) {
		//scanner
		Scanner in = new Scanner(System.in);

		//string to hold the name of file for user
		String choiceOfName;

		System.out.println("What would you like to name the file to write your scores to?");
		System.out.println("Remember, use the .txt format");

		//setting fileOutName as the string they entered
		choiceOfName = in.nextLine();

		try {
			//creating new PrintStream object and passing the file name from user to it
			PrintStream myFileWriter = new PrintStream(choiceOfName);

			//create an object from the random class to generate the scores in the for loops
			Random rando = new Random(); 

			//writing the number of players (determined already) as the first line of file
			myFileWriter.println(numberOfPlayers);

			//generating and writing a random number score per line
			for(int i = 0; i < courseLength; i++) {
				for(int j = 0; j < numberOfPlayers; j++) {
					myFileWriter.print((rando.nextInt(7) + 1) + " ");
				}
				myFileWriter.println();
			}

			//close input to avoid potential memory leaks
			if(myFileWriter != null) {
				myFileWriter.close();
			}

		}
		//catches file not found error
		catch(FileNotFoundException e) {
			System.out.println("File not found, please try a different name");
		}

		System.out.println(); //for spacing
	}

	/**
	 * This method reads the scores file that was previously generated. First it prompts the user to enter the
	 * text file that they wish to read. It should be obvious, since they just created/labeled it, but if they 
	 * enter it wrong the program exits. The method reads the score file into an array of variable length 
	 * depending on the number of golfers in the game and the holes in the game. It then prints the final
	 * score card of the game (the array it read the scores into) using a for loop. Finally it calls on the 
	 * determineWinner method to figure out who won the game.
	 * @param players the number of golfers playing
	 * @param totalPar the total par of the game
	 * @param courseLength the total number of holes in the course
	 * @throws Exception 
	 */
	public void readScoresFile(int players, int totalPar, int courseLength) throws Exception{

		//scanner
		Scanner in = new Scanner(System.in);

		//string to hold the name of the file they want to read in
		String scoreCardName;

		System.out.println("What is the name of the score card you would like to read (.txt format)?");
		System.out.println("Here's a hint - you just created it");

		//sets the input of the user the file name they choose
		scoreCardName = in.nextLine();

		//creates a file object
		File myFile = new File(scoreCardName);

		try {
			//creates a scanner object called myFileReader and reads the myFile file they choose

			Scanner myFileReader = new Scanner(myFile);
			int i = 0;

			int[][] scoreArray = new int[courseLength][players];

			//throws away integer for players in the file
			myFileReader.next();

			/**
			 * used in checking for improper format
			my counter variable
			int a = 0;
			**/
			
			//reads the file and stores it in to an array of [18][number of players]
			while(myFileReader.hasNextInt()) {
				
				
				/**This is a commented out section of my program that checks to see if the program would
				 * have been formatted improperly. What it does it tallies up all the integers, and checks
				 * to see if they equal the (courseLength*players) which should be the total amount of 
				 * elements in the file. If it doesn't then the file throws an exception and exits. Since the
				 * files in this program will never be formatted improperly, I commented it out. 
				 *  
				while(myFileReader.hasNextInt()){
					myFileReader.nextInt();
					a++;
				}
				System.out.println(a); //just to check if the counter counted correctly
				
				if(a != (players*courseLength)) {
					throw new MyException();
				}
				**/
			
			for(int j = 0; j < players; j++) {
				scoreArray[i][j] = myFileReader.nextInt();
			}
			i ++;
		}

		System.out.println("The Final Scorecard:");
		//Printing the score card
		for(int k = 0; k < courseLength; k++) {
			for(int q = 0; q < players; q++) {
				System.out.print(scoreArray[k][q] + " ");
			}
			System.out.println();
		}

		determineWinner(scoreArray, players, totalPar, courseLength);

		//close input to avoid potential memory leaks
		if(myFileReader != null) {
			myFileReader.close();
		}

	}
	//catches and exits if they don't enter a valid text file
	catch(FileNotFoundException e) {
		System.out.println("Sorry text file not found, exiting program");
	}
	/**
	 catch(MyException e) {
		System.out.println("Sorry improperly formatted file");
	}
		**/
}

/**
 * This method reads the course file, i.e. the file that was generated earlier that holds all the pars.
 * It does this by creating a new File object called myFile using the par.txt document. It then stores
 * what it read in an array called parArray that varies in size depending on how many holes the user
 * wanted to play. It prints the par array for the user to see the breakdown of the course. It then totals
 * all the pars to determine the total par of the course and returns it. Although it doesn't prompt the user
 * the method is still protected from invalid entry for the par.txt file should there have been an entry.
 * @param par the variable for par of the entire course
 * @param courseLength the number of holes for the course
 * @return returns the total value of par for the course
 */
public int readCourseFile(int par, int courseLength) {

	File myFile = new File("par.txt");

	try {
		//creates a scanner object called myFileReader and reads the myFile file "par.txt"
		Scanner myFileReader = new Scanner(myFile);

		int[] parArray = new int[courseLength];

		//reads the par file and stores it in an array of 18 elements
		while(myFileReader.hasNextInt()) {
			for(int p = 0; p < courseLength; p++){ 
				parArray[p] = myFileReader.nextInt();
			}
		}
		System.out.println(Arrays.toString(parArray));
		System.out.println(); //for spacing

		//finding the total par for the course
		for(int i = 0; i < courseLength; i++){
			par = par + parArray[i];
		}

		//close input to avoid potential memory leaks
		if(myFileReader != null) {
			myFileReader.close();
		}

	}
	//catches and exits if they don't enter a valid text file
	catch(FileNotFoundException e) {
		System.out.println("Sorry text file not found, exiting program");
	}
	return par;
}

/**
 * Determines how well each player did compared to par by simple subtraction of the course par to the users
 * score. Negative values mean they shot under par.
 * @param playersSum each players total score
 * @param coursePar total par for the course
 */
public void compareToPar(int playersSum, int coursePar) {
	System.out.println("Compared to Par they were " + (playersSum - coursePar));
}

/**
 * This method first calculates and stores the sum of each players score in an array. Then it prints
 * a table of these values AND how well each player did compared to par (by calling the compareToPar method).
 * Finally it determines the winner of the game by a conditional statement additionally printing if it 
 * is a tie. 
 * @param finalScoreArray the values of all players final scores
 * @param players2 the number of players
 * @param totalPar2 the total par for the course
 * @param holes the total holes for the course
 */
public void determineWinner(int[][] finalScoreArray, int players2, int totalPar2, int holes) {

	int sum = 0;
	int minScore = 1000;
	int winningPlayer = -1;
	boolean tieGame = false;
	int[] finalScores = new int[players2];

	//Adds each players scores
	for(int p = 0; p < players2; p++ ) {
		for(int h = 0; h < holes; h++) {
			sum = sum + finalScoreArray[h][p];
		}
		//putting each players final score into an array
		finalScores[p] = sum;
		System.out.println("Player " + p + "'s total score is: " + sum);
		compareToPar(sum, totalPar2);
		System.out.println();
		//determining the best score, the smallest
		if(sum == minScore) {
			minScore = sum;
			tieGame = true;
		}
		else if(sum < minScore) {
			minScore = sum;
			winningPlayer = p;
			tieGame = false;
		}
		//assign sum 0 for the first for loop aka starting at 0 for the next players scores
		sum = 0;
	}

	//printing out the winner, starts at 0 so added 1
	if (tieGame == false){
		System.out.println("Player " + winningPlayer + " was the winner and the winning score was " + minScore);
	}
	else if (tieGame == true) {
		System.out.println("There was no winner because atleast 2 players tied");	
	}
}
}
