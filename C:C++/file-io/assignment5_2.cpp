/*********************************************************************
 ** Program Filenames: assignment5_2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/9/14
 ** Description: Chapter 12, programming project 6
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

int main() {

  vector<int> v;
  int num;

	//declare an input stream and open input1.txt
 	string filename = "input1.txt";
 	ifstream ifs1(filename.c_str());
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

 	//declare an input stream and open input2.txt
 	string filename2 = "input2.txt";
 	ifstream ifs2(filename2.c_str());
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

	//open output file stream
	string filename3 = "sortedoutput.txt";
	ofstream ofs(filename3.c_str());
	//for every integer in the vector, write this to a file
	for(auto i = v.begin(); i != v.end(); ++i) {
 		ofs << *i << endl;
 	}
 	//close output stream
 	ofs.close();


	return 0;
}
