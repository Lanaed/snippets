/*********************************************************************
 ** Program Filenames: lab3.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/16/14
 ** Description: Lab #3
 ** Input: test doc ("grades.txt")
 ** Output: overwritten grades.txt file
 *********************************************************************/

 #include <iostream>
 #include <fstream>
 #include <sstream>
 #include <string>
 #include <cstdlib>
 #include <iomanip>

 using namespace std;

 void computeGrades(string gradesFile, string gradesRewrite);

 int main() {

 	//string to hold the grades file you are testing
 	string gradesFile;

 	//prompts for the user to enter 1 of the 3 choices
 	cout << "Enter grades file name which you want to test: ";
 	cout << "Choices are:" << endl;
 	cout << "[grades1.txt]  [grades2.txt]  [grades3.txt] : Don't misspell:" << endl;
 	cin >> gradesFile;

 	//temporary file which you will rewrite the data to before overwriting original file
 	string gradesRewrite = "temporary.txt";

 	//call compute grades function and send it the two files
 	computeGrades(gradesFile, gradesRewrite);

 	return 0;
 }

/*********************************************************************
 ** Function: computeGrades
 ** Description: Reads the grades file, calculates the average of the
 ** total quiz score and appaneds it to the end of each line. Writes the
 ** new grades file to the temporary file (including the header and the
 ** new total quiz score average). Reads the temporary file, and overwrites
 ** the original file.
 ** Parameters: strings for the names of the input file and temporary file
 *********************************************************************/
 void computeGrades(string inputFile, string outputFile) {

 	//open up an input file stream to read the grades file
 	ifstream ifs(inputFile.c_str());
 	//exit gracefully if this fails
 	if (ifs.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//open up an output file stream to write to temporary text
 	ofstream ofs(outputFile.c_str());

 	//string to use in getLine to represent a line of data
 	string line;

 	//strings to represent the first and last name of student
 	string fname;
 	string lname;

 	//integers to represent a quiz score, the total quiz scores and the sum of quiz scores
 	int grade;
 	int numberOfGrades;
 	int sum;

 	//double to represent the calculated average of quiz scores
 	double mean;

 	//output the header of the new file to the temporary file
 	ofs << "Grades of Students in Class: XXXX" << endl;
 	ofs << "***********************************************************" << endl;
 	ofs << "Description:" << endl;
	ofs << "Student name on the left." << endl;
	ofs << "Scores follow the name." << endl;
	ofs << "Average (out of 10) appended at the end of each line." << endl;
	ofs << "***********************************************************" << endl;
 	ofs << "\n";
 	ofs << "\n";

 	//start reading/writing the grades file
 	while(getline(ifs, line)) {
 		stringstream ss(line); //stringstream to parse each line
 		sum = 0; //set the sum to 0 of all grades

		if (ss >> fname >> lname) { //ensure we've read first and last name
			ofs << fname << " " << lname << " "; //output these to the temp file
			while (ss >> grade) { //while there are integers to be read
				sum += grade; //add these integers to the sum
				ofs << grade << " "; //and write them to the file
			}
		}
		//end of reading/writing first part of that line
		mean = sum / 10.0; //find the average quiz score (if they missed quizes they get 0's)
		//use <iomanip> to distinguish the double
		ofs << setw(5) << mean << endl; //write this to the end of the line in the temp file
	} //start over if there are more lines to be read

	//close the input and output file streams
	ifs.close();
	ofs.close();

	//open up new input and output file streams
	//this time reading from the temp and writing to the grades files
	ifstream ifs2(outputFile.c_str());
 	//exit gracefully if this fails
 	if (ifs2.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//open up an output file stream to write to temporary text
 	ofstream ofs2(inputFile.c_str());

 	//read each line of the temp file and write it (overwrite) to the grades file
	while(getline(ifs2, line)) {
		ofs2 << line << endl;
	}

	//close the new filestreams
	ifs2.close();
	ofs2.close();

}
