/********************************************************************* 
 ** Program Filenames: assignment3_2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 1/26/14
 ** Description: #2. Write a program that logs visitors into a building
 ** They need to be able to enter a name, check if the name is entered,
 ** and remove names. Use a vector. 
 ** Input: The user typing in names to log people in, the user typing
 ** names to find people logged in, and the user typing names to remove
 ** them from the building.
 ** Output: names in the vector
 *********************************************************************/ 

#include <iostream>
#include <vector>
#include <iterator>
#include <algorithm>

 using std::endl;
 using std::cin;
 using std::cout;
 using std::vector;
 using std::string;
 using std::distance;


 int main() {
	//variables for restarting the whole process
 	bool replay = true;
 	string choice = "yes";

 	//my vector which will hold people's names
 	vector<string> checkIn;

 	//booleans for when the user wishes to stop entering, removing, searching for people
 	bool doneEntering = false;
 	bool doneRemoving = false;
 	bool doneSearching = false;

 	//string to hold peoples names
 	string name;

 	//start the entering and exiting process
 	do {
 		//check people in
 		cout << "Enter name/s of people checking in, type 'stop' to stop entering: " << endl;
 		while (doneEntering == false) {
 			cin >> name;
 			//exit if user types stop
 			if (name == "stop") {
 				break;
 			}
 			//checks if they are already checked in, source in reflection
 			if(std::find(checkIn.begin(), checkIn.end(), name) != checkIn.end()) {
    			cout << "That person is already in the building!" << endl;
			}
			//if they aren't, check the person in, add them to the vector
			else {
				checkIn.push_back(name);			
			}
 		}

		//Display a list of everyone in the building for checking purposes mostly
		cout << "Here is a list of people in the building:" << endl;
 		for(auto i = checkIn.begin(); i != checkIn.end(); ++i) {
 			cout << "Person " << distance(checkIn.begin(), i) << " : " << *i << endl;
 		}

 		//check people out
 		cout << "Remove people by typing their names, type 'stop' to stop:" << endl;
 		while (doneRemoving == false) {
 			cin >> name;
 			//exit if user types stop
 			if (name == "stop") {
 				break;
 			}
 			//make sure they are in the building first, source in reflection
 			if(std::find(checkIn.begin(), checkIn.end(), name) != checkIn.end()) {
 				//remove them if they are in the building, source cplusplus.com
    			checkIn.erase(std::remove(checkIn.begin(), checkIn.end(), name), checkIn.end());
    			cout << name << " has been removed" << endl;
			}
			//display if the user tried to remove someone who wasn't in the building
			else {
				cout << "Sorry, cant remove a person that isn't there" << endl;			
			}
 		}

 		//search for people
 		cout << "Search for people by typing their names, type 'stop' to stop:" << endl;
 		while (doneSearching == false) {
 			cin >> name;
 			//exit if user types stop
 			if (name == "stop") {
 				break;
 			}
 			//check if they are in the building
 			if(std::find(checkIn.begin(), checkIn.end(), name) != checkIn.end()) {
    			cout << name << " is in the building" << endl;
			}
			//display if the user tried to remove someone who wasn't in the building
			else {
				cout << "Sorry, that person is not in the building" << endl;			
			}
 		}

		//ask them if they would like to start entering people again (i.e. start over)
 		cout << "Type yes to start the process over, any other key to exit:" << endl;
 		cin >> choice;
 		if (choice == "yes") {
 			replay = true;
 		}
 		else
 			replay = false;
 	} while (replay == true);

 	return 0;
 }