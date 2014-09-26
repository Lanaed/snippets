/********************************************************************* 
 ** Program Filenames: assignment3_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 1/26/14
 ** Description: #1 Build an inventory system for an antique store, each
 ** item is based on an item class. Data members: name, age, color,
 ** asking price, and price paid. They ALWAYS know the name and asking
 ** price.
 ** Input: None in console, but constructing items and mutating them for
 ** testing the item class from main().
 ** Output: Return values from item.h
 *********************************************************************/ 

#include <iostream>
#include <string>
#include "item.h"
 using namespace std;

 int main() {

//first object
 	cout << "Ceating first item" << endl;
 	item firstItem("toy", 12);
//acessing values from first object
 	cout << "Accessing first item" << endl;
 	cout << firstItem.getName() << endl;
 	cout << firstItem.getColor() << endl; //should return default "unkown"
 	cout << "\n";

//second object
 	cout << "Creating second item" << endl;
 	item secondItem("ball", 12, 4, "blue", 5);
 	cout << secondItem.getName() << " ";
 	cout << secondItem.getAskingPrice() << " ";
 	cout << secondItem.getAge() << " ";
 	cout << secondItem.getColor() << " ";
 	cout << secondItem.getPricePaid() << " ";
 	cout << "\n";
//using some mutators
 	cout << "Mutating second item" << endl;
 	secondItem.setColor("orange");
 	secondItem.setAge(50);
//check that this worked
 	cout << secondItem.getColor() << " ";
 	cout << secondItem.getAge() << " ";
 	cout << "\n";
//change secondItem using the constructor
 	cout << "Changing second item explicity with constructor" << endl;
 	secondItem = item("newball", 11, 3, "red", 4);
//check if it worked
 	cout << secondItem.getName() << " ";
 	cout << secondItem.getAskingPrice() << " ";
 	cout << secondItem.getAge() << " ";
 	cout << secondItem.getColor() << " ";
 	cout << secondItem.getPricePaid() << endl;

 	return 0;
 }