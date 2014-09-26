/********************************************************************* 
 ** Program Filenames: assignment6_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/16/14
 ** Description: Chapter 14, programming project 1
 ** Input: Class manipulations
 ** Output: printed examples of class manipulations
 *********************************************************************/ 

 #include <iostream>
 #include "Employee.h"
 #include "SalariedEmployee.h"
 #include "Administrator.h"

 using namespace std;

 int main() {

 	//check Employee is working
 	cout << "Checking to see if Employee class is working:" << endl;
 	Employee one;
 	cout << one.getName() << endl;
 	cout << one.getSsn() << endl;

 	cout << "\n";
 	cout << "\n";
 
 	//check Salaried Employee is working
 	cout << "Checking to see if SalariedEmployee class is working:" << endl;
 	//create object using default constructor
 	SalariedEmployee two;
  	cout << "Printing a blank check:" << endl;
 	two.printCheck();
  	cout << "\n";
  	cout <<"Printing an actual check for different SalariedEmployee Object:" << endl;
 	SalariedEmployee three("Joe", "125", 500.30);
 	three.printCheck();

 	cout << "\n";
  	cout << "\n";

 	//check administrator class
 	cout << "Checking to see if Administrator class is working: " << endl;
 	Administrator four("Arnold", "73658", 760.50, 45000, "Intern Leader", "In charge of interns", "Susan");

  	cout << "\n";
 	cout << "\n";

 	//print the data to see if object is constructing properly
 	four.print();

  	cout << "\n";
 	cout << "\n";

 	//print the check to see if the overloading function worked properly
 	four.printCheck();

  	cout << "\n";
 	cout << "\n";

 	//create a new default 'blank object'
 	cout << "Creating a default Administrator:" << endl;
 	Administrator five;
 	//print to see if its working
 	five.print();

 	cout << "\n";
 	cout << "\n";

 	//use the readInData to fill this object
 	five.readInData();

  	cout << "\n";
 	cout << "\n";

 	//print again to see it worked
 	five.print();

 	return 0;
 }