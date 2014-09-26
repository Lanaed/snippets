/********************************************************************* 
 ** Program Filenames: assignment5_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14
 ** Description: Chapter 12, Programming Project 3, parts a and b
 ** Input: a. a text file b. a text file
 ** Output: a. The median of a text file b. The three quartiles
 *********************************************************************/

#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <string>

 using namespace std;

 //function declarations
 void calculateOdd(string filename, int num, int totalElements);
 void calculateEven(string filename, int num, int totalElements);

 int main() {

 	//declare an input stream and open file1.txt
 	string filename = "file1.txt";
 	ifstream ifs(filename.c_str());
 	//exit gracefully if this fails
 	if (ifs.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//variables for integers in file, and total number of integers
 	int num;
 	//assumption 1 number is entered
 	int totalElements = 1;
 	ifs >> num;
 	//keep reading while there is input
 	while(ifs.good()) { //same as while(ifs) cplusplus.com
 		ifs >> num;
 		totalElements++;
 	}

 	//print total number in file to check
 	cout << "There are " << totalElements << " elements in the file" << endl;
 	ifs.close(); //close input file stream

 	//checking whether to find median and quartiles for an odd or even total numbers in file
 	if (totalElements%2 == 0) { //no remainder when divided by 2 means even
 		calculateEven(filename, num, totalElements);
 	}
 	else
 		calculateOdd(filename, num, totalElements);

 	return 0;
 }

/********************************************************************* 
 ** Function: calculateEven
 ** Description: Calculates the even median, first quartile flag and second
 ** quartile flag
 ** Parameters:  filename, num, totalElements
 *********************************************************************/
 void calculateEven(string filename, int num, int totalElements) {

 	//open up a new stream called ifs2
 	ifstream ifs2(filename.c_str());
 	//check to make sure it did not fail to open
 	if (ifs2.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//declare variables for spots in the file and integers to hold value of num in those spots
 	//EM is even median, FQ is first quartile, TQ is third Quartile, each have high and low values
 	int lowEM;	//holds num value
 	int highEM;
 	int lowFQ;
 	int lowTQ;
 	int highFQ;
 	int highTQ;
 	int lowEMSpot = totalElements/2; //finds spot right before true middle
 	int highEMSpot = totalElements/2 + 1; //finds spot right after true middle
 	int lowFQSpot = totalElements/4;	//finds spot right below first quartile flag
 	int lowTQSpot = (totalElements/4)*3;
 	int highFQSpot = totalElements/4 + 1;	//finds spot right after first quartile flag
 	int highTQSpot = (totalElements/4)*3 + 1;
 	int evenCounter = 1; //counting the elements in the file, assuming 1
 	ifs2 >> num;
 	while(ifs2.good()) {
 		ifs2 >> num;
 		evenCounter++;
 		//at that spot in file, take that number and set it equal to the int to hold said number
 		if(evenCounter == lowEMSpot) {
 			lowEM = num;
 		}
 		if(evenCounter == highEMSpot) {
 			highEM = num;
 		}
 		if(evenCounter == lowFQSpot) {
 			lowFQ = num;
 		}
 		if(evenCounter == lowTQSpot) {
 			lowTQ = num;
 		}
 		if(evenCounter == highFQSpot) {
 			highFQ = num;
 		}
 		if(evenCounter == highTQSpot) {
 			highTQ = num;
 		}
 	}
 	//close the stream
 	ifs2.close();

 	//calculate the "average of the high and low flags" which is the true number
 	double actualMedian = (lowEM + highEM)/2.0;
 	double actualFirstQuartile = (lowFQ + highFQ)/2.0;
 	double actualThirdQuartile = (lowTQ + highTQ)/2.0;

 	//print so the user can see
 	cout << "Median is between values: " << lowEM << " and " << highEM << " = " << actualMedian << endl;
 	cout << "First quartile marker is between values: " << lowFQ << " and " << highFQ << " = " << actualFirstQuartile << endl;
 	cout << "Third quartile marker is between values: " << lowTQ << " and " << highTQ << " = " << actualThirdQuartile << endl;
 }

/********************************************************************* 
 ** Function: calculateOdd
 ** Description: Calculates the odd median, first quartile flag and second
 ** quartile flag
 ** Parameters:  filename, num, totalElements
 *********************************************************************/
 void calculateOdd(string filename, int num, int totalElements) {

 	ifstream ifs2(filename.c_str());
 	if (ifs2.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//OM = odd median, FQ = first quartile, TQ = third quartile
 	int OM;
 	int FQ;
 	int TQ;
 	int OMSpot = totalElements/2 + 1; //example 1, 2, 3, 4, 5 --> 5/2 = 2 in integer divison, but I want 3rd spot so +1
 	int FQSpot = totalElements/4 + 1;
 	int TQSpot = (totalElements/4)*3 + 1;
 	int oddCounter = 1;
 	ifs2 >> num;
 	while(ifs2.good()) {
 		ifs2 >> num;
 		oddCounter++;
 		if(oddCounter == OMSpot) {
 			OM = num;
 		}
 		if(oddCounter == FQSpot) {
 			FQ = num;
 		}
 		if(oddCounter == TQSpot) {
 			TQ = num;
 		}
 	}

 	//close the stream
 	ifs2.close();

 	//print to the user
 	cout << "Median is at spot " << OMSpot << " and has a value of " << OM << endl;
 	cout << "First quartile marker is at spot " << FQSpot << " and has a value of " << FQ << endl;
 	cout << "Second quartile marker is at spot " << TQSpot << " and has a value of " << TQ << endl;
 }
