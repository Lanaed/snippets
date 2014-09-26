/********************************************************************* 
 ** Program Filenames: assignment4_2try2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: main driver class for #2
 ** Input: 
 ** Output: 
 *********************************************************************/ 

 #include <iostream>
 #include <vector>
 #include "Vector2Dtry2.h"
 #include <iterator>

 using namespace std;

 int main() {

 	//for dimenisons of vectors
 int a;
 int b;
 int c;
 int d;

cout << "Choose x and y for first vector:" << endl;
cin >> a >> b;
//first vector object
Vector2Dtry2 firstVector(a, b);

cout << "Choose x and y for second vector:" << endl;
cin >> c >> d;
//second vector object
Vector2Dtry2 secondVector(c, d); // getting input for vectors

//third vector object
Vector2Dtry2 thirdVector(10, 10);

//using overloaded operator
thirdVector = firstVector * secondVector;

//print to see it works
cout<< thirdVector.getX() << endl;
cout << thirdVector.getY() << endl;


return 0;

 }
