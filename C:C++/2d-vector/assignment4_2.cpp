/********************************************************************* 
 ** Program Filenames: assignment4_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: main driver class for #2
 ** Input: 
 ** Output: 
 *********************************************************************/ 

 #include <iostream>
 #include <vector>
 #include "Vector2D.h"
 #include <iterator>

 using namespace std;

 int main() {

 	Vector2D defaultVector;
 	defaultVector.printVector();
 	cout << "\n";

 	Vector2D newVector(5, 5);
 	newVector.printVector();
 	newVector.setVectorElement(4, 4, 10);
 	cout << "\n";
 	newVector.printVector();

 	Vector2D vector_2(5,5);

 	Vector2D vector_3(5,5);

 	vector_3 = vector_2*newVector;

 	return 0;
 }
