/********************************************************************* 
 ** Program Filenames: assignment2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 1/19/14
 ** Description: Savitch Ch.18 : #2, #4
 ** Input: (#2) user input for depth 
 ** Output: (#2) exception thrown in main (if user enters 0), exception thrown
 ** depth specified by user (if they enter value 1-10), (#4) product Id's
 ** and an exception when a product ID is not found
 *********************************************************************/ 

#include <iostream>
 using std::cout;
 using std::endl;
 using std::cin;
 using std::string;

 class theException{};
 class notFound{};

/********************************************************************* 
 ** Function: myRecursiveFunction
 ** Description: A function that calls itself a (user input, 1-10) number
 ** of times. It throws an exception at its final call regardless of
 ** the depth it reaches.
 ** Parameters: int depth, int userDepth
 ** Returns: depth
 *********************************************************************/

 int myRecursiveFunction(int depth, int userDepth) throw (theException) {

 	cout << "depth is: " << depth << endl;
 	if (depth == userDepth) {
		//throws exception at the user specified level
 		throw theException();
 	}
	//returns the depth if it hasn't reached level to throw exception 
 	if (depth >= 10) {
 		return depth;
 	}
	//calls itself again
 	myRecursiveFunction(++depth, userDepth);
 }

/********************************************************************* 
 ** Function: getProductID
 ** Description: This function loops through the product array, if a match
 ** is found, it returns the corresponding product ID. If no match is
 ** found, it throws an exception.
 ** Parameters: int ids[], string names[], int numProducts, string target
 ** Returns: product ID, (or throws an exception)
 *********************************************************************/

 int getProductID(int ids[], string names[], int numProducts, string target) throw (notFound) {
 	for (int i = 0; i < numProducts; i++) {
 		if (names[i] == target)
 			return ids[i];
 	}
 	//if ID is not found, throw here and catch in main
	throw notFound(); //not found
}

int main() {

	// Savitch (#2)

	//initialize userDepth to impossible value
	int userDepth = -1;

	//protect against input below 0 or above 10
	do {
		cout << "Enter the depth at which you would like to throw an exception (0-10): ";
		cin >> userDepth;
	} while (userDepth > 10 || userDepth < 0);
	
	try {
		//in the case depth = 0, main both throws and catches exception
		if (userDepth == 0) {
			throw theException();
		}
		//if depth is 1-10, the function is called and the exception is thrown there
		else
			myRecursiveFunction(1, userDepth);
	}
	catch (theException) {
		cout << "Exception thrown, aborting" << endl;
	}

	// Savitch (#4)
	cout << "\n";
	cout << "Searching for product id..." << endl;
	
	int productIds[] = {4, 5, 8, 10, 13};
	string products[] = {"computer", "flash drive", "mouse", "printer", "camera"};

	//put the try in here, lumped all the calls into it
	try {
		cout << getProductID(productIds, products, 5, "mouse") << endl;
		cout << getProductID(productIds, products, 5, "camera") << endl;
		cout << getProductID(productIds, products, 5, "laptop") << endl;
	}
	catch (notFound) {
		cout << "The product ID was not found, aborting program!" << endl;
	}
	return 0;
}