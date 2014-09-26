/**************************************************************************************** 
 ** Program Filenames: cs325_project1_timingCode.cpp
 ** Authors: Ethan Spiro, Barbara Hazlett, Wing Yee Leung
 ** Class: CS 325
 ** Due Date: 7/20/14
 **
 ** Description: Three algorithms solving the max sub array problem. A timing function, and
 ** a main function which runs the execution time of the three algorithms on randomly
 ** generated arrays of length 100, 200, 300, 400, 500, 600, 700, 800, 900, (from here on
 ** only timing algorithm2 and algorithm3), 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000,
 ** and 9000. Each data point is actually generated 10 times (in a loop) and then we take
 ** the average of the 10 run times to iron out discrepancies. 
 ** Input: none
 ** Output: Displays the execution time (10 times) for each of the three arrays on each of
 ** the 18 different array lengths. Displays the average execution time/algorithm/array.
 **
 ** Compile line on flip: g++ -std=c++0x cs325_project1_timingCode.cpp -o <your executable name>
 ***************************************************************************************/ 

#include <iostream>
#include <algorithm>
#include <climits>
#include <ctime>
#include <cstdlib>

using namespace std;

/**************************************************************************************** 
 ** Function: algorithm1
 ** Description: Enumeration - Loops over each pair of indices i, j and compute the sum of
 ** i-j of k[]. Returns the max sub array found.
 ** Run Time: O(n^3)
 ** Parameters: integer array, size of array
 ***************************************************************************************/
int algorithm1(int *arr, int sizeOfArray) {

    int tempMax = arr[0];
    int sum = arr[0];

    for (int i = 0; i < sizeOfArray; i++) {
        for (int j = i; j < sizeOfArray; j++) {
            tempMax = 0;
            for (int k = i; k <= j; k++) {
                tempMax += arr[k];
                sum = max(sum, tempMax); 
            }   
        }
    }
    return sum;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~OLD ~~ O(N^2)
// int algorithm1(int *arr, int sizeOfArray) {
//     int tempMax = arr[0]; //current max
//     int sum = arr[0];    //sum

//     for (int i = 0; i < sizeOfArray; i++) {
//         //reset current
//         tempMax = 0;
//         for (int j = i; j < sizeOfArray; j++) {
//             //sum of every arr[i..j]
//             tempMax += arr[j];
//             //if the newly calculated sum - tempMax - is greater than our sum, we save it
//             sum = max(sum, tempMax);
//         }
//     }
//     return sum;
// }
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**************************************************************************************** 
 ** Function: algorithm2
 ** Description: Better Enumeration - same as algorithm1 but with removing repetive sum
 ** calculations.
 ** Run Time: O(n^2)
 ** Parameters: integer array, size of array
 ***************************************************************************************/
//Algorithm 2 - O(N^2)

int algorithm2(int *arr, int sizeOfArray) {
    int tempMax = arr[0]; //current max
    int sum = arr[0];    //sum

    for (int i = 0; i < sizeOfArray; i++) {
        //reset current
        tempMax = 0;
        for (int j = i; j < sizeOfArray; j++) {
            //sum of every arr[i..j]
            tempMax += arr[j];
            //if the newly calculated sum - tempMax - is greater than our sum, we save it
            sum = max(sum, tempMax);
        }
    }
    return sum;
}

//OLD (boss) algorithm2 - O(n)

// int algorithm2(int *arr, int sizeOfArray) {

//     int tempMax = 0;    //temp max subarray
//     int sum = arr[0];        //maximum sub array of arr[0...i]
//     int maxElement = INT_MIN;   //for checking if the array is all negative

//     for (int i = 0; i < sizeOfArray; i++) {
//         tempMax = max(tempMax + arr[i], 0);
//         sum = max(sum, tempMax);
//         maxElement = max(maxElement, arr[i]);
//     }

//     if (sum == 0) {
//         sum = maxElement;
//     }

//     return sum;
// }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/**************************************************************************************** 
 ** Function: algorithm3_helper
 ***************************************************************************************/
int algorithm3_helper(int *arr, int start, int mid, int end) { //linear time

    int leftSum = INT_MIN; //<climits>
    int rightSum = INT_MIN;
    int sum = 0;

    for (int i = mid; i >= start; i--) {
        sum += arr[i];
        leftSum = max(leftSum, sum);
    }
    sum = 0;

    for (int j = mid + 1; j <= end; j++) {
        sum += arr[j];
        rightSum = max(rightSum, sum);
    }
    return leftSum + rightSum;
}

/**************************************************************************************** 
 ** Function: algorithm3
 ** Description: Divide and Conquer - split the array in half and find solution recursively
 ** Run Time: O(n log n)
 ** Parameters: integer array, start of array (index), end of array (index)
 ***************************************************************************************/
int algorithm3(int *arr, int start, int end) {
    
    int mid = 0;
    int leftSum = 0;
    int rightSum = 0;
    int crossSum = 0;

    //if there is only 1 element in array, return it
    if (start == end) {
        return arr[start];
    }
    else {
        //calculate the mid
        mid = (start + end) / 2;

        //recursive calls
        leftSum = algorithm3(arr, start, mid); //first half
        rightSum = algorithm3(arr, mid+1, end); //second half
        crossSum = algorithm3_helper(arr, start, mid, end); //cross

        if (leftSum >= rightSum && leftSum >= crossSum) {
            return (leftSum < 0 ? 0 : leftSum);
        }
        else if (rightSum >= leftSum && rightSum >= crossSum) {
            return (rightSum < 0 ? 0 : rightSum);
        }
        else {
            return (crossSum < 0 ? 0 : crossSum);
        }
    }
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
 ** Description: 
 ** Parameters: the array, length of array
 ***************************************************************************************/
void timeAlgorithms(int specificArray[], int size) {

    double runOfTen_alg1 = 0;
    double runOfTen_alg2 = 0;
    double runOfTen_alg3 = 0;

    //10 times for smooth results
    for (int i = 0; i < 10; i++) {

        //fill with random values
        fillArray(specificArray, size);

        //algorithm 1
        double t1 = getMilliseconds();
        algorithm1(specificArray, size);
        double t2 = getMilliseconds();
        double runTime_alg = t2 - t1;
        cout << "(alg 1)Run time " << i+1 << " = " << runTime_alg << " milliseconds" << endl;
        runOfTen_alg1 += runTime_alg;

        //algorithm2
        double t3 = getMilliseconds();
        algorithm2(specificArray, size);
        double t4 = getMilliseconds();
        runTime_alg = t4 - t3;
        cout << "(alg 2)Run time " << i+1 << " = " << runTime_alg << " milliseconds" << endl;
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
    double averageOfTen_alg1 = runOfTen_alg1 / 10.0;
    double averageOfTen_alg2 = runOfTen_alg2 / 10.0;
    double averageOfTen_alg3 = runOfTen_alg3 / 10.0;

    //print averages to console
    cout << "Average of algorithm1 runtimes = " << averageOfTen_alg1 << endl;
    cout << "Average of algorithm2 runtimes = " << averageOfTen_alg2 << endl;
    cout << "Average of algorithm3 runtimes = " << averageOfTen_alg3 << endl;
    cout << endl;

    //clear variables to be safe
    averageOfTen_alg1 =  averageOfTen_alg2 = averageOfTen_alg3 = runOfTen_alg1 = runOfTen_alg2 =  runOfTen_alg3 = 0;
}

/**************************************************************************************** 
 ** Function: only2_timeAlgorithms
 ** Description: Same as time algorithms, but removing timing of algorithm 1
 ** Parameters: the array, length of array
 ***************************************************************************************/
void only2_timeAlgorithms(int specificArray[], int size) {

    double runOfTen_alg2 = 0;
    double runOfTen_alg3 = 0;

    //10 times for smooth results
    for (int i = 0; i < 10; i++) {

        //fill with random values
        fillArray(specificArray, size);

        //algorithm2
        double t3 = getMilliseconds();
        algorithm2(specificArray, size);
        double t4 = getMilliseconds();
        double runTime_alg = t4 - t3;
        cout << "(alg 2)Run time " << i+1 << " = " << runTime_alg << " milliseconds" << endl;
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
    cout << "Average of algorithm2 runtimes = " << averageOfTen_alg2 << endl;
    cout << "Average of algorithm3 runtimes = " << averageOfTen_alg3 << endl;
    cout << endl;

    //clear variables to be safe
    averageOfTen_alg2 = averageOfTen_alg3 = runOfTen_alg2 =  runOfTen_alg3 = 0;
}

/**************************************************************************************** 
 ** Function: main
 ** Description: Creates, fills, times 18 different arrays sizes 100-9000 elements on our
 ** 3 algorithms. 
 ***************************************************************************************/
int main() {

    //NOTE - if you want to generate results to a file, not the console, uncomment line below and line at end of main
    //freopen ("timingResults.txt","w",stdout);

    //Create, fill, and time array of 100 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 100 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array100[100];
    int length = (sizeof(array100)) / (sizeof(int));
    timeAlgorithms(array100, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 200 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 200 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array200[200];
    length = (sizeof(array200)) / (sizeof(int));
    timeAlgorithms(array200, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 300 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 300 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array300[300];
    length = (sizeof(array300)) / (sizeof(int));
    timeAlgorithms(array300, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 400 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 400 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array400[400];
    length = (sizeof(array400)) / (sizeof(int));
    timeAlgorithms(array400, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 500 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 500 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array500[500];
    length = (sizeof(array500)) / (sizeof(int));
    timeAlgorithms(array500, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 600 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 600 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array600[600];
    length = (sizeof(array600)) / (sizeof(int));
    timeAlgorithms(array600, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 700 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 700 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array700[700];
    length = (sizeof(array700)) / (sizeof(int));
    timeAlgorithms(array700, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 800 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 800 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array800[800];
    length = (sizeof(array800)) / (sizeof(int));
    timeAlgorithms(array800, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 900 elements w/ all 3 algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 900 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array900[900];
    length = (sizeof(array900)) / (sizeof(int));
    timeAlgorithms(array900, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 1000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 1000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array1000[1000];
    length = (sizeof(array1000)) / (sizeof(int));
    only2_timeAlgorithms(array1000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 2000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 2000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array2000[2000];
    length = (sizeof(array2000)) / (sizeof(int));
    only2_timeAlgorithms(array2000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 3000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 3000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array3000[3000];
    length = (sizeof(array3000)) / (sizeof(int));
    only2_timeAlgorithms(array3000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 4000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 4000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array4000[4000];
    length = (sizeof(array4000)) / (sizeof(int));
    only2_timeAlgorithms(array4000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 5000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 5000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array5000[5000];
    length = (sizeof(array5000)) / (sizeof(int));
    only2_timeAlgorithms(array5000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 6000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 6000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array6000[6000];
    length = (sizeof(array6000)) / (sizeof(int));
    only2_timeAlgorithms(array6000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 7000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 7000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array7000[7000];
    length = (sizeof(array7000)) / (sizeof(int));
    only2_timeAlgorithms(array7000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 8000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 8000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array8000[8000];
    length = (sizeof(array8000)) / (sizeof(int));
    only2_timeAlgorithms(array8000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    // Create, fill, and time array of 9000 elements w/ 2 (not the first) algorithms
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~ Array of size 9000 ~~~~~~~~~~~~~~~~~~~~~~~" << endl;
    int array9000[9000];
    length = (sizeof(array9000)) / (sizeof(int));
    only2_timeAlgorithms(array9000, length);
    cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" << endl;

    //uncomment for generating to file
    //fclose (stdout);

    return 0;
}