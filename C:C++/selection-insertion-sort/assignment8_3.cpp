/********************************************************************* 
 ** Program Filenames: assignment8_3.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 **
 ** Description: Chapter 16, Programming Project 3
 ** The template sort routine in Display 16.3 is based on an algorithm called the selection sort. 
 ** Another related sorting algorithm is called insertion sort. The insertion sort algorithm is the sort 
 ** method often used to sort a Bridge hand. Consider each element in turn, inserting it into its proper 
 ** place among the elements at the start of the array that are already sorted. The element being 
 ** considered is inserted by moving the larger elements “to the right” to make space and inserting 
 ** the vacated place. For example, the following shows the steps in a selection sort of an array of int s 
 ** a . The values of a[0] through a[4] are given on each line. The asterisk marks the boundary between 
 ** the sorted and unsorted portions of the array. 
 **   2 * 5 3 4 
 **   2 5 * 3 4 
 **   2 3 5 * 4 
 **   2 3 4 5 * 
 ** First, write an insertion sort function that works for int s. Next, write the template version of this 
 ** sort function. Finally, test thoroughly using several primitive types, using a type you create with 
 ** the minimal machinery necessary to use the sort routine. 
 **
 ** Input: none
 ** Output: arrays (integer, double, char(lowercase))  unsorted and sorted
 *********************************************************************/

 #include <iostream>
 using namespace std;

 const int ARRAY_SIZE = 10;

 /********************************************************************* 
 ** Declaration for insertionSort template
 *********************************************************************/
 template<typename T>
 void insertionSort(T array[], T key);

 /********************************************************************* 
 ** Declaration for printArray template
 *********************************************************************/
 template<typename T>
 void printArray(T array[]);

 int main() {

 		//integer array (unsorted)
        int a[ARRAY_SIZE] = {3, 5, 7, 8, 9, 2, 1, 4, 6, 10};
        int aKey = 0; //temporary
        cout << "Integer array before sort:" << endl;
        printArray(a);
        cout << "Sorting..." << endl;
        insertionSort(a, aKey);
        printArray(a);
        
        cout << "\n";

        //double array (unsorted)
        double b[ARRAY_SIZE] = {3.2, 5.5, 7.7, 8.8, 9.9, 2.2, 1.1, 4.4, 6.6, 10.1};
        double bKey = 0; //temporary
        cout << "Double array before sort:" << endl;
        printArray(b);
        cout << "Sorting..." << endl;
        insertionSort(b, bKey);
        printArray(b);

        cout << "\n";

        //char array (unsorted)
        char c[ARRAY_SIZE] = {'d', 'a', 'f', 'e', 'b', 'g', 'c', 'j', 'k', 'i'};
        char cKey = 'a'; //temporary
        cout << "Char array before sort:" << endl;
        printArray(c);
        cout << "Sorting..." << endl;
        insertionSort(c, cKey);
        printArray(c);


 	return 0;
 }

/********************************************************************* 
 ** Template: insertionSort
 ** Description: Displays results of different primitive types if they
 ** have been found in the specified array.
 ** Type parameters (specifications): T array[], T key
 ** Parameters: none
 *********************************************************************/
 template<typename T>
 void insertionSort(T array[], T key) {
 	int j = 0; //for indexing
		for (int i = 1; i < ARRAY_SIZE; i++) {
                key = array[i];
                j = i - 1;
                while((j >= 0) && (array[j] > key)) {
                        array[j+1] = array[j];
                        j -= 1;
                }
                array[j+1] = key;
        }
        cout << "\n";
 }

/********************************************************************* 
 ** Template: printArray
 ** Description: Displays results of an array of different types
 ** Type parameters (specifications): T array[]
 ** Parameters: none
 *********************************************************************/
 template<typename T>
 void printArray(T array[]) {
 	for (int i = 0; i < ARRAY_SIZE; i++) {
 		cout << array[i] << " ";
 	}
 	cout << "\n";
 }