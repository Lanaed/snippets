/****************************************************************************************
 ** Program Filenames: cs325_project2_comparison.cpp
 ** Authors: Ethan Spiro, Barbara Hazlett, Wing Yee Leung
 ** Class: CS 325
 ** Due Date: 8/3/14
 **
 ** Description: A comparison of the recursive method and the DP emethod. A timing function,
 ** a main function which runs the execution time of the two algorithms on randomly
 ** generated arrays of length 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 3000, 
 ** 4000, 5000, 6000, 7000, 8000, and 9,000 .... 1000000. 
 ** 
 ** Input: none
 ** Output: Displays the execution time (10 times) for each of the 2 arrays on each of
 ** the many different array lengths. Displays the average execution time/algorithm/array.
 **
 ** Compile line on flip: g++ -std=c++0x cs325_project2_comparison.cpp -o <your executable name>
 ***************************************************************************************/
 
#include <iostream>
#include <algorithm>
#include <climits>
#include <ctime>
#include <cstdlib>
 
using namespace std;
 

 
/****************************************************************************************
 ** Function: algorithm_DP
 ** Description: Returns the max sub array found.
 ** Run Time: O(n)
 ** Parameters: integer array, size of array
 ***************************************************************************************/
int algorithm_DP(int *arr, int sizeOfArray) {
 	
 	int dp_table[sizeOfArray];
 	dp_table[0] = arr[0];

 	for(int i = 1; i < sizeOfArray; i++) {
 		 dp_table[i] = max(arr[i], arr[i] + dp_table[i-1]);
 	}

 	int max = INT_MIN;
 	
 	for(int i = 0; i < sizeOfArray; i++){
  		if(dp_table[i] > max) {
   			max = dp_table[i];
   		}
 	}

 	return max;
}

/****************************************************************************************
 ** Function: algorithm3
 ** Description: Divide and Conquer - split the array in half and find solution recursively
 ** Run Time: O(n log n)
 ** Parameters: integer array, start of array (index), end of array (index)
 ***************************************************************************************/
 int algorithm3(int arr[], int start, int end) {
	 
    int mid, lmax, lmin, lminsum, rmax, rmin, rminsum, sum, i, final;
    lminsum = 0;
    rminsum = 0;
    
    if(start > end) // 0 elements
   	 return 0;
    if(start == end) // 1 element
    	return arr[start];
   	 
    mid = (start + end) / 2;
    
    lmax = lmin = sum = 0;
    

    for(i = mid; i >= start; i--) {
   	 sum += arr[i];
   	 if(sum > lmax)
   		 lmax = sum;
   	 else {
   		 lmin = sum;    
   		 lminsum += lmin;
   		 if(lminsum <= lmin)
   			 lmin = lmin;
   		 else
   			 lmin = arr[i];
   	 }

    }
    
    rmax = sum = 0;
    
    for(i = mid+1; i <= end; i++) {
   	 sum += arr[i];
   	 if(sum > rmax)
   		 rmax = sum;    
   	 else {
   		 rmin = sum;    
   		 rminsum += rmin;
   		 if(rminsum <= rmin)
   			 rmin = rmin;
   		 else
   			 rmin = arr[i];
   	 }
    }
    
    final = max(max(algorithm3(arr, start, mid), algorithm3(arr, mid + 1, end)), lmax + rmax);
    if (final == 0)
   	 return ((max(max(algorithm3(arr, start, mid), algorithm3(arr, mid + 1, end)), lmin + rmin)));
    else
   	 return final;
}
 
/****************************************************************************************
 ** Function: getMilliseconds
 ** Description: returns clock time in milliseconds
 ** Parameters: none
 ***************************************************************************************/
double getMilliseconds() {
	clock_t(NULL);
	return 1000.0 * clock() / CLOCKS_PER_SEC;
}
 
/****************************************************************************************
 ** Function: fillArray
 ** Description: fills array of length 'size' with random number +50 to -49
 ** Parameters: the array, length of array
 ***************************************************************************************/
void fillArray(int arr[], int size) {
 	for (int i = 0; i < size; i++) {
    	arr[i] = (rand() % 101) - 50; //random numers +50 to -49
	}
}
 
/****************************************************************************************
 ** Function: timeAlgorithms
 ** Description: prints average run time
 ** Parameters: the array, length of array
 ***************************************************************************************/
void timeAlgorithms(int specificArray[], int size) {
 
	double runOfTen_alg2 = 0;
	double runOfTen_alg3 = 0;
 
	//10 times for smooth results
	for (int i = 0; i < 10; i++) {
 
    	//fill with random values
    	fillArray(specificArray, size);
 
    	//algorithm2
    	double t3 = getMilliseconds();
    	algorithm_DP(specificArray, size);
    	double t4 = getMilliseconds();
    	double runTime_alg = t4 - t3;
    	cout << "(DP)Run time " << i+1 << " = " << runTime_alg << " milliseconds" << endl;
    	runOfTen_alg2 += runTime_alg;
 
    	//algorithm3
    	double t5 = getMilliseconds();
    	algorithm3(specificArray, 0, size-1);
    	double t6 = getMilliseconds();
    	runTime_alg = t6 - t5;
    	cout << "(alg 3)Run time " << i+1 << " = " << runTime_alg << " milliseconds" << endl;
    	runOfTen_alg3 += runTime_alg;
    	 
    	cout << endl;
	}
 
	//calculate the averages
	double averageOfTen_alg2 = runOfTen_alg2 / 10.0;
	double averageOfTen_alg3 = runOfTen_alg3 / 10.0;
 
	//print averages to console
	cout << "Average of algorithm_DP runtimes = " << averageOfTen_alg2 << endl;
	cout << "Average of algorithm3 runtimes = " << averageOfTen_alg3 << endl;
	cout << endl;
 
	//clear variables to be safe
	averageOfTen_alg2 = averageOfTen_alg3 = runOfTen_alg2 =  runOfTen_alg3 = 0;
}
 
/****************************************************************************************
 ** Function: main
 ** Description: Creates, fills, times 18 different arrays sizes 100-x elements on our
 ** 3 algorithms.
 ***************************************************************************************/
int main() {
 
	//NOTE - if you want to generate results to a file, not the console, uncomment line below and line at end of main
	//freopen ("timingResults.txt","w",stdout);
 
	//Create, fill, and time array of 100 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 100 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array100[100];
	int length = (sizeof(array100)) / (sizeof(int));
	timeAlgorithms(array100, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 200 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 200 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array200[200];
	length = (sizeof(array200)) / (sizeof(int));
	timeAlgorithms(array200, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 300 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 300 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array300[300];
	length = (sizeof(array300)) / (sizeof(int));
	timeAlgorithms(array300, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 400 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 400 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array400[400];
	length = (sizeof(array400)) / (sizeof(int));
	timeAlgorithms(array400, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 500 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 500 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array500[500];
	length = (sizeof(array500)) / (sizeof(int));
	timeAlgorithms(array500, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 600 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 600 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array600[600];
	length = (sizeof(array600)) / (sizeof(int));
	timeAlgorithms(array600, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 700 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 700 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array700[700];
	length = (sizeof(array700)) / (sizeof(int));
	timeAlgorithms(array700, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 800 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 800 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array800[800];
	length = (sizeof(array800)) / (sizeof(int));
	timeAlgorithms(array800, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 900 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 900 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array900[900];
	length = (sizeof(array900)) / (sizeof(int));
	timeAlgorithms(array900, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 1000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 1000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array1000[1000];
	length = (sizeof(array1000)) / (sizeof(int));
	timeAlgorithms(array1000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 2000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 2000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array2000[2000];
	length = (sizeof(array2000)) / (sizeof(int));
	timeAlgorithms(array2000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 3000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 3000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array3000[3000];
	length = (sizeof(array3000)) / (sizeof(int));
	timeAlgorithms(array3000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 4000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 4000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array4000[4000];
	length = (sizeof(array4000)) / (sizeof(int));
	timeAlgorithms(array4000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 5000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 5000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array5000[5000];
	length = (sizeof(array5000)) / (sizeof(int));
	timeAlgorithms(array5000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 6000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 6000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array6000[6000];
	length = (sizeof(array6000)) / (sizeof(int));
	timeAlgorithms(array6000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 7000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 7000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array7000[7000];
	length = (sizeof(array7000)) / (sizeof(int));
	timeAlgorithms(array7000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 8000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 8000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array8000[8000];
	length = (sizeof(array8000)) / (sizeof(int));
	timeAlgorithms(array8000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	// Create, fill, and time array of 9000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 9000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array9000[9000];
	length = (sizeof(array9000)) / (sizeof(int));
	timeAlgorithms(array9000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 20000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 20000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array20000[20000];
	length = (sizeof(array20000)) / (sizeof(int));
	timeAlgorithms(array20000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 50000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 50000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array50000[50000];
	length = (sizeof(array50000)) / (sizeof(int));
	timeAlgorithms(array50000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 100000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 100000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array100000[100000];
	length = (sizeof(array100000)) / (sizeof(int));
	timeAlgorithms(array100000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 200000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 200000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array200000[200000];
	length = (sizeof(array200000)) / (sizeof(int));
	timeAlgorithms(array200000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 500000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 500000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array500000[500000];
	length = (sizeof(array500000)) / (sizeof(int));
	timeAlgorithms(array500000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

	// Create, fill, and time array of 1000000 elements
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 1000000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
	int array1000000[1000000];
	length = (sizeof(array1000000)) / (sizeof(int));
	timeAlgorithms(array1000000, length);
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;
 
	//uncomment for generating to file
	//fclose (stdout);
 
	return 0;
}
