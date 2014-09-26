/********************************************************************* 
 ** Program Filenames: assignment4_3.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: main driver class for #3
 ** Input: programmer input for creating objects, and user input for
 ** creating a prime number. 
 ** Output: postfix and prefix ++ & -- output when used on object of the
 ** PrimeNumber class. 
 *********************************************************************/

  #include <iostream>
 #include "PrimeNumber.h"
 using std::cout;
 using std::cin;
 using std::endl;

 int main() {

 	//create an object using default constructor
 	PrimeNumber firstPrime;
 	//use getPrime() to print the number should be 1
 	cout<< "Printing prime number (default constructor): ";
 	cout << firstPrime.getPrime() << endl;

 	//use setPrime() to change number to 7
 	firstPrime.setPrime(7);
 	cout << "Checking to see if setPrime() worked: ";
 	cout << firstPrime.getPrime() << endl;

 	cout << "\n";

 	int userPrime;
 	cout << "Enter a prime number: ";
 	cin >> userPrime;
 	//use overloaded constructor and user input to create new object
 	PrimeNumber secondPrime(userPrime);
 	cout << "Your prime number is: ";
 	cout << secondPrime.getPrime() << endl;

 	cout << "\n";

 	//use prefix ++ operator on secondPrime
 	++secondPrime;
 	cout << "After using prefix ++ operator: ";
 	cout << secondPrime.getPrime() << endl;

 	cout << "\n";

 	//use postfix ++ operator on secondPrime
 	secondPrime++;
 	cout << "After using postfix ++ operator: ";
 	cout << secondPrime.getPrime() << endl;

 	cout << "\n";

 	//use prefix -- operator on secondPrime
 	--secondPrime;
 	cout << "After using prefix -- operator: ";
 	cout << secondPrime.getPrime() << endl;

 	cout << "\n";

 	//use postfix -- operator on secondPrime
 	secondPrime--;
 	cout << "After using postfix -- operator: ";
 	cout<< secondPrime.getPrime() << endl;

 	return 0;
 }
