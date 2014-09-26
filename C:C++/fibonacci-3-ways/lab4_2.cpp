/*********************************************************************
 ** Program Filenames: lab4_2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14

 ** Description: Chapter 13, programming project 6a
 ** Examine the recursive function computation of Fibonacci numbers. Note that each Fibonacci 
 ** number is recomputed many times. To avoid this recomputation, do Programming Project 13.1 
 ** iteratively, rather than recursively; that is, do the problem with a loop. You should compute each 
 ** Fibonacci number once on the way to the number requested and discard the numbers when they 
 ** are no longer needed. 

 ** Input: choice of n
 ** Output: first 20 fibs and a user choice fib
 *********************************************************************/

 #include <iostream>
 using namespace std;

 int iterativeFibonacci(int n);

 int main() {

    //print the first 10 fibonacci numbers so you can see it is working
	for (int i = 0; i < 20; i++) {
		cout << "Fibonacci #" << i << " = " << iterativeFibonacci(i) << endl;
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
    cout << iterativeFibonacci(userInput);

 	return 0;
 }

/********************************************************************* 
 ** Function: iterativeFibonacci
 ** Description: returns the nth fib number iteratively, and discards
 ** fibs along the way to save space
 ** Parameters: int n
 *********************************************************************/
 int iterativeFibonacci(int n) {

    //initialize these as 1 to start algorithm
    int previous = 1;
    int fib = 1;

    for (int i = 2; i <= n; i++) {
        int newFib = previous + fib;
        previous = fib;
        fib = newFib;
    }           
    return fib;
}