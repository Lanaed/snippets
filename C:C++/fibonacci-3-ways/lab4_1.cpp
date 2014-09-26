/*********************************************************************
 ** Program Filenames: lab4_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14

 ** Description: Chapter 13, Programming Project 1
 ** Write a recursive function definition for a function that has one parameter n of type int and that 
 ** returns the n th Fibonacci number. The Fibonacci numbers are F0 is 1, F1 is 1, F2 is 2, F3 is 3, F4 is 5, 
 ** and in general Fi+2 = Fi + Fi+1 for i = 0, 1, 2, ... 

 ** Input: chocie of n
 ** Output: first 20 fibs and a user fib
 *********************************************************************/

 #include <iostream>
 using namespace std;

int recursiveFibonacci(int n);

int main() {

	//print the first 10 fibonacci numbers so you can see it is working
	for (int i = 0; i < 20; i++) {
		cout << "Fibonacci #" << i << " = " << recursiveFibonacci(i) << endl;
	}

	//allow the user to pick a fib
	cout << "*note: not protected against invalid non int input" << endl;
	cout << "\n";
	int userInput = -1;
	do {
	cout << "Now pick the nth fibonacci number you would like to see [0-40]: ";
	cin >> userInput;
	} while (userInput < 0 || userInput > 40);
	cout << "\n";
	cout << recursiveFibonacci(userInput);

	return 0;
}

/********************************************************************* 
 ** Function: recursiveFibonacci
 ** Description: returns the nth fib number recursively
 ** Parameters: int n
 *********************************************************************/
int recursiveFibonacci(int n) {

    if (n == 0 || n == 1) {
        return 1;
    }
    return recursiveFibonacci(n-1) + recursiveFibonacci(n-2);
}
