/********************************************************************* 
 ** Program Filenames: assignment8_2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14

 ** Description: Chapter 16, Programming Project 2
 **
 ** Write a template version of the recursive binary search function from Display 13.7 (EDITED). Specify 
 ** requirements on the template parameter type. Discuss the requirements on the template parameter 
 ** type.
 

 ** Input: an integer, a double, a character to search for, a chance to replay
 ** Output: The full arrays printed, and if the searched for item is in the array or not
 *********************************************************************/

  #include <iostream>
 using namespace std;

 const int ARRAY_SIZE = 10; //for all arrays

/********************************************************************* 
 ** Declaration for recursive template version of binary search
 *********************************************************************/
 template<typename T>
 void searchRecursive(const T array[], int first, int last, T key, bool& found, int& location);

/********************************************************************* 
 ** Declaration for displayResults template
 *********************************************************************/
 template<typename T>
 void displayResults(bool& found, T type, int& location);

/********************************************************************* 
 ** Description: Driver function
 *********************************************************************/
 int main() {

 	//integer array (sorted low to high)
 	int a[ARRAY_SIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
 	cout << "Here is your sorted integer array:" << endl;
 	for (int i = 0; i < ARRAY_SIZE; i++) {
 		cout << a[i] << " ";
 	}
 	cout << "\n";

 	//double array (sorted low to high)
 	double b[ARRAY_SIZE] = {1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.10};
 	cout << "Here is your sorted double array:" << endl;
 	for (int i = 0; i < ARRAY_SIZE; i++) {
 		cout << b[i] << " ";
 	}
 	cout << "\n";

 	//char array (sorted low to high)
  	char c[ARRAY_SIZE] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'};
 	cout << "Here is your sorted char array:" << endl;
 	for (int i = 0; i < ARRAY_SIZE; i++) {
 		cout << c[i] << " ";
 	}
 	cout << "\n";

 	cout << "Search time" << endl;

 	//set up variables
 	//for the final index
 	const int finalIndex = ARRAY_SIZE - 1;
 	//for the three types of keys to search for
 	int iKey;
 	double dKey;
 	char cKey;
 	//for the location in the array 
 	int location;
 	//boolean for if the key was found
 	bool found;

 	bool doneSearching = false;

 	do {
 	//allows user to search
 	cout << "Enter an integer to search for: " << endl;
 	cin >> iKey;
 	cout << "Enter an double to search for: " << endl;
 	cin >> dKey;
  	cout << "Enter an character to search for: " << endl;
 	cin >> cKey;

 	//call the searchRecursive templated function for integers
 	searchRecursive(a, 0, finalIndex, iKey, found, location);
 	displayResults(found, iKey, location);

 	//call the searchRecursive templated function for doubles
 	searchRecursive(b, 0, finalIndex, dKey, found, location);
 	displayResults(found, dKey, location);

 	//call the searchRecursive templated function for characters
 	searchRecursive(c, 0, finalIndex, cKey, found, location);
 	displayResults(found, cKey, location);

 	cout << "Search again? Press [a], Any other key to quit." << endl;
 	string userChoice;
 	cin >> userChoice;
 	if (userChoice == "a") {
 		doneSearching = false;
 	}
 	else {
 		doneSearching = true;
 	}

 } while(doneSearching == false);

 	return 0;
 }



/********************************************************************* 
 ** Template: searchRecursive
 ** Description: Searches recursively through an array to locate a
 ** user specified value. Can be used for arrays of different primitive
 ** types (that can be sorted).
 ** Type parameters (specifications): const T array[], T key
 ** Parameters: int first, int last, bool& found, int& location
 *********************************************************************/
 template<typename T>
 void searchRecursive(const T array[], int first, int last, T key, bool& found, int& location) {

 	int mid;
 	if (first > last) {
 		found = false;
 	}
 	else {
 		mid = (first + last) / 2;

 		if (key == array[mid]) {
 			found = true;
 			location = mid;
 		}
 		else if (key < array[mid]) {
 			searchRecursive(array, first, mid - 1, key, found, location);
 		}
 		else if (key > array[mid]) {
 			searchRecursive(array, mid + 1, last, key, found, location);
 		}
 	}
 }

/********************************************************************* 
 ** Template: displayResults
 ** Description: Displays results of different primitive types if they
 ** have been found in the specified array.
 ** Type parameters (specifications): T type
 ** Parameters: bool& found, int& location
 *********************************************************************/
 template<typename T>
 void displayResults(bool& found, T type, int& location) {
 	if (found) {
 		cout << type << " is in index location " << location << endl;
 	}
 	else {
 		cout << type << " is not in the array." << endl;
 	}
 }