/**
 * Program: GolfScore.java
 * @author Ethan Spiro
 * Date Due: 6/9/2013
 * 
 * Description: This program writes a par.txt file and a scores.txt file (that the user names) by randomly generating
 * values to simulate a game of golf WITH an arbitrary number of holes and golfers determined by the user. It then
 * reads these files, stores them into arrays, and determines each players total score, how well they did to par
 * and who won the game. 
 * 
 * Input: The user will be prompted throughout the program to enter - holes they wish to play, number of golfers,
 * the file name they wish to write their scores to, and the file name they wish to read their scores from. 
 * 
 * Output: The program will write to two files, a par.txt file and a score.txt file (that the user names). It will
 * also print to the console the breakdown of par for the course, the total par, the final score card for all players,
 * each players total score, how well each player shot compared to par, and the winner of the game should there be
 * one and their winning score.
 */

public class GolfScores {

	public static void main(String[] args) throws Exception {

		//variable to store the number of golfers in this game
		int golfers;
		int total_par = 0;
		int number_holes = 0;

		//creating a new object called golfGame derived from an instance of the GolfMethods Class
		GolfMethods golfGame = new GolfMethods();

		//getting the number of holes from user
		number_holes = golfGame.getHoles(number_holes);

		//writing the course information file
		golfGame.writeCourseFile(number_holes);

		//reading the course file
		System.out.println("Beautiful day for a game of golf!");
		System.out.println("Here is the breakdown of par for the course:");

		//reads the par.txt file just written, stores each par into an array + prints the array, calculates total par + returns it
		total_par = golfGame.readCourseFile(total_par, number_holes);

		System.out.println("The total par on the course is: " + total_par);

		//setting golfers variable by using the getGolfers method (which takes in user input)
		golfers = golfGame.getGolfers();

		//writing the players score card using a random number generator with limits
		golfGame.writeScoresFile(golfers, number_holes);

		System.out.println("Now Playing Game...");
		System.out.println("Game Complete, you " + golfers + " golfers played the " + number_holes + " hole course great!");
		System.out.println("Your Scores have been tallied.");

		//Reads score file, stores in array, prints out table including winner plus how well each player did
		golfGame.readScoresFile(golfers, total_par, number_holes);

	}
}