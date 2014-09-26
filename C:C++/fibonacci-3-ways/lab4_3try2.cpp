/*********************************************************************
 ** Program Filenames: lab4_3.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14
 
 ** Description: Chapter 13, Programming project 7
 ** (You need to have first completed Programming Project 13.6 to work on this project.) When 
 ** computing a Fibonacci number using the most straightforward recursive function definition, the 
 ** recursive solution recomputes each Fibonacci number too many times. To compute Fi+2 = Fi + Fi+1 , 
 ** it computes all the numbers computed in F i a second time in computing Fi+1 . You can avoid this 
 ** by saving the numbers in an array while computing Fi . Write another version of your recursive 
 ** Fibonacci function based on this idea. In the recursive solution for calculating the N th Fibonacci 
 ** number, declare an array of size N. Array entry with index i stores the ith (i … N) Fibonacci 
 ** number as it is computed the first time. Then use the array to avoid the second (redundant) 
 ** recalculation of the Fibonacci numbers. Time this solution as you did in Programming Project 
 ** 13.6 , and compare it to your results for the iterative solution. 

 ** Input: choice of n
 ** Output: a user choice fib
 *********************************************************************/

 #include <iostream>
 using namespace std;

 int recFibWithTable(int n, int fibTable[]);

 int main() {


	//allow the user to pick a fib
 	cout << "*note: not protected against invalid non int input" << endl;
 	cout << "\n";
 	int userInput;
	cout << "Now pick the nth fibonacci number you would like to see [0-40]: ";
 	cin >> userInput;

 	//declare a pointer and allocate userInput space
 	int *fibTable;
 	fibTable = new int[userInput+1];
	//initialize the array with -1 values
 	for (int i = 0; i < userInput+1; i++) {
 			fibTable[i] = -1;
 		}

 	cout << "\n";

 	//call the recursive function
 	cout << recFibWithTable(userInput, fibTable);

 	return 0;
 }

/********************************************************************* 
 ** Function: recFibWithTable
 ** Description: returns the nth fib number recursivly by memoization
 ** by storing previously calculated fib numbers in array to speed up
 ** the algorithm
 ** Parameters: int n
 *********************************************************************/
 int recFibWithTable(int n, int fibTable[]) {

	//for 0 and 1st fib numbers return 1
 	if (n == 0 || n == 1) {
 		return 1;
 	}

    //if the fib table value has been filled in aka does not equal -1
 	if(fibTable[n] != -1)
        return fibTable[n]; //use prestored values from the array
    else { //use recursion
    	fibTable[n] = recFibWithTable(n - 1, fibTable) + recFibWithTable(n - 2, fibTable);
    	return fibTable[n];
    }
}