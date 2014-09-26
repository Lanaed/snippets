import java.util.Scanner;


public class Board {
	//create a 2 dimensional array called theBoard
	private String[][] theBoard;

	//create the rows and columns as constants
	private static final int ROWS = 3;
	private static final int COLUMNS = 3;

	public String gameTitle;	//variable for the method for title of the game declared 
	public String currentBoard; //variable declared for the method for showing the state of the board


	//declare, the X and the O, and 0 for the empty cell
	String[] choices = {"X", "O", " "};

	//constructor for Board class
	public Board(String gameTitle) {
		this.gameTitle = gameTitle;
		//creating a new array object called theBoard
		theBoard = new String[ROWS][COLUMNS];

		//fill the board with null (empty) values
		for (int i = 0; i < ROWS; i++)
			for(int j = 0; j < COLUMNS; j++)
				theBoard[i][j] = choices[2];
	}

	// Returns int[] of a legal [row,col] where the user wants to go
	public int[] getLegalMove() {
		Scanner input = new Scanner(System.in);		//scanner input for program
		int row = 0, col = 0;
		boolean validInput = false;
		System.out.println("Row and column values must be either 0, 1, or 2.");
		while (!validInput) {
			System.out.println("row:");
			while (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid selection");
			}
			row = input.nextInt();
			System.out.println("col:");
			while (!input.hasNextInt()) {	
				input.next();
				System.out.println("That's not a valid selection");
			}
			col = input.nextInt();
			
			if (row >= 0 && row <= 2 && col >= 0 && col <= 2) {
				validInput = true;
			} else {
				System.out.println("Row and column values must be either 0, 1, or 2.");
			}
		}
			// TODO: reject if board[row,col] is filled and that row and col are either 0, 1, or 2.
		return new int[]{row,col};
	}
	
	//a method that shows the current state of the board when called upon
	public String currentBoard() {
		//prints out the board
		String boardString = "-------\n";
		for (int i = 0; i < ROWS; i++) {
			boardString += "|";
			for(int j = 0; j < COLUMNS; j++) {
				boardString += theBoard[i][j] + "|";
			}
			boardString += "\n-------\n";
		}
		return boardString; 
	}

	// Set [i,j] element of the board to be s
	public void setElement(int i, int j, String s) {
		this.theBoard[i][j] = s;
	}
	
	//a method which returns a String that holds the title of the TicTacToe game
	public String getTitle() {
		return gameTitle;
	}
	
	//a method that determines if an input is a winner for the board
	public boolean isWinner(String player) {
		//horizontal wins
		if (theBoard[0][0].equals(player) && theBoard[0][1].equals(player) && theBoard[0][2].equals(player))
			return true;
		if (theBoard[1][0].equals(player) && theBoard[1][1].equals(player) && theBoard[1][2].equals(player))
			return true;
		if (theBoard[2][0].equals(player) && theBoard[2][1].equals(player) && theBoard[2][2].equals(player))
			return true;
		//vertical wins
		if (theBoard[0][0].equals(player) && theBoard[1][0].equals(player) && theBoard[2][0].equals(player))
			return true;
		if (theBoard[0][1].equals(player) && theBoard[1][1].equals(player) && theBoard[2][1].equals(player))
			return true;
		if (theBoard[0][2].equals(player) && theBoard[1][2].equals(player) && theBoard[2][2].equals(player))
			return true;
		//diagonal wins
		if (theBoard[0][0].equals(player) && theBoard[1][1].equals(player) && theBoard[2][2].equals(player))
			return true;
		if (theBoard[2][0].equals(player) && theBoard[1][1].equals(player) && theBoard[0][2].equals(player))
			return true;
		return false;
	}
	
	public boolean isGameDone() {
		int playCount = 0;
		// count number of elements not equal to 0
		for (int i = 0; i < ROWS; i++)
			for(int j = 0; j < COLUMNS; j++)
				if (theBoard[i][j] != " ")
					playCount ++;
		boolean isDone = isWinner("X") || isWinner("O") || (playCount == 9);
		return isDone;
	}
}
