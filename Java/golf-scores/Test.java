import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.Random;


public class Test {

	public static void main(String[] args) {
		String coursePar = "par.txt";
		int courseLength = 18;

		try {
			//creating new PrintStream object and passing the file name from user to it
			PrintStream myFileWriter = new PrintStream(coursePar);
			Random rand = new Random(); 
			
			//writing the random course info to par.txt
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

		System.out.println(); //for spacing
		System.out.println("Write Mode now exiting, goodbye!");
		System.out.println(); //for spacing
	}

}


/**while(myFileReader.hasNext()) {
				//prints out line numbers
				System.out.print("/*" + lineNumber + "*/ ");
				System.out.println(myFileReader.nextLine()); prints the file in the console
				increments lineNumber variable
				lineNumber++;
			} **/
			
			while(myFileReader.hasNextInt() && (j == players)) {
				if(j > players) {
					throw new Exception("Too many scores on Line!");
				}
				if(j < players) {
					throw new Exception("Too few scores on line!");
				}
				if(i > courseLength) {
					throw new Exception("Too many holes on this scorecard!");
				}
				for(j = 0; j < players; j++) {
					scoreArray[i][j] = myFileReader.nextInt();
				}
				i ++;
			}

