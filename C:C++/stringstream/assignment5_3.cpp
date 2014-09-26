/********************************************************************* 
 ** Program Filenames: assignment5_3.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14
 ** Description: Chapter 12, Programming Project 25
 ** Input: Integer value from user
 ** Output: Extracted integer using stringstream class, or a prompt to
 ** enter another number if no integer is found
 *********************************************************************/ 

 #include <iostream>
 #include <fstream>
 #include <sstream>
 #include <string>

using namespace std;

//declaration of function to validate for integer only input
int getIntegerInput();

int main() {

	//variable to store the user input
	int userInput;

	//prompt the user
	cout << "Enter an integer: ";

	//set the user input to the return value of validation function
	userInput = getIntegerInput();


	//print to see that it worked
	cout << "You selected: " << userInput << endl;

	return 0;
}

/********************************************************************* 
 ** Function: getIntegerInput
 ** Description: uses stringstream to take input as a string and then
 ** search for an integer. If an integer is found, it extracts it, 
 ** exits the loop and return the integer. If an integer is not found,
 ** the user is prompted to enter again.
 ** Parameters: none
 *********************************************************************/
int getIntegerInput() {

	string input; //to whold user input
	int num; //for extracting int
	while(getline(cin, input)) {
		stringstream ss(input);
		if (ss >> num) { //if ss is able to extract an integer
			return num;
		}
		else {
			cout << "Failed to enter an integer, try again" << endl;
		}
	}
}