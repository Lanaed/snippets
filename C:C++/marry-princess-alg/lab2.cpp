/********************************************************************* 
 ** Program Filenames: lab2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: Modify your code from Assignment 3 to handle the playground
 ** problem of eeny meeny miney mo. 
 ** Input: User input for # of people playing the game, and replay option.
 ** Output: Shows who is "it" for the next round, and prints new vector
 *********************************************************************/ 

#include <iostream>
#include <vector>
#include <iterator>

using namespace std;

 int main() {

	//prompt the user for the number of players
 	cout << "How many people playing the game?:" << endl;
 	int players;
 	cin >> players;

	//create a vector with the players, label them 1-n to mark positions
 	vector<int> myVector;
 	for(int i = 0; i < players; ++i) {
 		myVector.push_back(i+1);
 	}

	//print to check original list of players
 	cout << "Here is the list of players" << endl;
 	for(auto i = myVector.begin(); i != myVector.end(); ++i) {
 		cout << *i << " ";
 	}

 	cout << "\n";

 	//variables for playing again
 	string choice = "yes"; //what the user will enter
 	bool gameOver = false;

 	cout << "Play Tag!" << endl;
 	//eliminates according to the algorithm eeny meeny miney
 	do {

 		int whosIt = myVector[0]; //who is it = beginning of the vector

 		// (1)eeny, (2)meeny, (3)miney, (4)mo, (5)catch...(20)miney, (21)mo!
 		for (int i = 0; i < 20; i++) {
 		myVector.push_back(myVector.front()); //20 times
 		myVector.erase(myVector.begin());
 		}

 		//check to see if the person it, is it again
 		if(whosIt == myVector[0]) {
 			//if they are push them to the back of the vector (one extra iteration)
 		myVector.push_back(myVector.front());
 		myVector.erase(myVector.begin());
 		//now the person to their right is it
 		cout << "Person: " << myVector[0] << " is it" << endl;
 	}
 	else {
 		//if there is a new person it, print off the new person who is it
 		cout << "Person: " << myVector[0] << " is it" << endl;
 	}

 		//print vector to see new lineup
 		for(auto i = myVector.begin(); i != myVector.end(); ++i) {
 			cout << *i << " ";
 		}
 		cout << "\n";

 		//give the user an option to play again
 		cout << "Play again? Type yes to play. Anything else - stop playing ";
 		cin >> choice;
 		if (choice == "yes") {
 			gameOver = false;
 		}
 		else
 			gameOver = true;
 	} while (gameOver == false);

 	return 0;
 }