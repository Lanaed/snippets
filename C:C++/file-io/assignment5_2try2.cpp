 /*********************************************************************
 ** Program Filenames: assignment5_2try2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14
 ** Description: Chapter 12, programming project 6 (TRY 2)
 ** note* I made it a separate function, not in main, everything else
 ** is essentially the same
 ** Input: two files, both sorted smallest to largest int
 ** Output: one file, sorted smallest to largest int
 *********************************************************************/

 #include <iostream>
 #include <fstream>
 #include <algorithm>
 #include <vector>
 #include <cstdlib>
 #include <iterator>

using namespace std;

void sortFiles(string file1, string file2, string file3);

int main() {

 	string filename = "input1.txt";
 	string filename2 = "input2.txt";
 	string filename3 = "sortedoutput.txt";
 	sortFiles(filename, filename2, filename3);

	return 0;
}

void sortFiles(string file1, string file2, string file3) {

 	vector<int> v; //vector to store values in files read in
 	int num; //num to use in stringstream

	ifstream ifs1(file1.c_str());
 	//exit gracefully if this fails
 	if (ifs1.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//while there are numbers read them and add them to vector
 	while(ifs1.good()) {
 		ifs1 >> num;
 		v.push_back(num);
 	}
 	//close first file stream
 	ifs1.close();

	ifstream ifs2(file2.c_str());
 	//exit gracefully if this fails
 	if (ifs2.fail()) {
 		cout << "Opening the file failed" << endl;
 		exit(1);
 	}

 	//while there are numbers read them and add them to vector
 	while(ifs2.good()) {
 		ifs2 >> num;
 		v.push_back(num);
 	}
 	//close the second file stream
 	ifs2.close();

 	//sort the vector, method from cplusplus.com
	sort(v.begin(), v.end());

	ofstream ofs(file3.c_str());
	//for every integer in the vector, write this to a file
	for(auto i = v.begin(); i != v.end(); ++i) {
 		ofs << *i << endl;
 	}
 	//close output stream
 	ofs.close();

}