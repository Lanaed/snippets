
public class test {

	public static void main(String[] args) {
		
		Board myBoard = new Board("my new board");
		
//		int[] playerMove = myBoard.getLegalMove();
//		System.out.println("row:"+ playerMove[0] + ",col:" + playerMove[1]);
//		
		// Test board printing
		myBoard.setElement(0, 0, "X");
		myBoard.setElement(0, 1, "O");
		myBoard.setElement(1, 0, "X");
		myBoard.setElement(2, 0, "X");
		String whatever = myBoard.currentBoard();
		System.out.println(whatever);
		
		System.out.println("X is a winner:" + myBoard.isWinner("X"));
		System.out.println("O is a winner:" + myBoard.isWinner("O"));
		
		System.out.println("Is the game done?" + myBoard.isGameDone());
		
	}
//		//create a 2 dimensional array for the board
//		String[][] theBoard;
//		
//		//create the rows and columns as constants
//		final int ROWS = 3;
//		final int COLUMNS = 3;
//		
//		//declare, the X and the O and 0 as the empty cell
//		String[] choosers = {"X", "O", "0"};
//		
//					
//			//creating a new array object called theBoard
//			theBoard = new String[ROWS][COLUMNS];
//			
//			//fill the board with null (empty) values
//			for (int i = 0; i < ROWS; i++)
//				for(int j = 0; j < COLUMNS; j++)
//					theBoard[i][j] = choosers[2];
//			
//			//print out the board
//			for (int i = 0; i < ROWS; i++) {
//				for(int j = 0; j < COLUMNS; j++) {
//					System.out.print(theBoard[i][j] + " ");
//				}
//					System.out.println();
//			}
//			}
//	
				
	}


