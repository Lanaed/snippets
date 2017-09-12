/****************************************************************************************
 ** Program Filenames: cs325_project4_tsp.cpp
 ** Authors: Ethan Spiro, Barbara Hazlett, Wing Yee Leung
 ** Class: CS 325
 ** Due Date: 8/24/14
 **
 ** Description: Traveling salesman problem
 ** Input: test-input-*.txt from command line
 ** Output: .txt.tour file with total best tour length on line o, order of tour on following
 ** lines
 **
 ** Compile line on flip: g++ -std=c++0x cs325_project4_tsp.cpp -o <your executable name>
 ***************************************************************************************/
 
#include <iostream>
#include <cmath>
#include <assert.h>
#include <fstream>
#include <vector>
#include <iterator>
#include <limits>
#include <algorithm>
#include <string>
#include <stdio.h>
#include <stdlib.h>

using namespace std;


/****************************************************************************************
 ** Struct: cityType
 ** Description: Each city has an id, coordinate (x,y) on a plane, and bool
 ***************************************************************************************/
struct cityType {

	int id;
    int x;
    int y;
	bool visited;
};

/****************************************************************************************
 ** Function: output()
 ** Description: Outputs the shortest distance and shortest tour
 ** Parameters: output file name, shortest Distance, shortest Tour
 ***************************************************************************************/
void output(string filename, unsigned long shortestDist, vector<int> shortestTour) {

	int i;
	
	filename = filename + ".tour"; //add .tour to the end
	ofstream outfile(filename); //creat output stream
	
	outfile << shortestDist << endl; //output distance
	
	for(i = 0; i < shortestTour.size();  i++) { //output tour
		outfile << shortestTour[i] << endl;
	}
	
	outfile.close(); 

}



/****************************************************************************************
 ** Function: calcDistance()
 ** Description: Calculates the distance between two nodes
 ** Parameters: two struct cityType (2 nodes)
 ***************************************************************************************/ 
int calcDistance(struct cityType a, struct cityType b) {

	return (int)(round(sqrt ( pow((b.x - a.x), 2) + pow((b.y - a.y), 2))));

}

/****************************************************************************************
 ** Function: nearestNeighbor()
 ** Description: calculates best tour from starting city
 ** Parameters: inNode = starting city, the total distance, a vector of cities, vector of tour
 ***************************************************************************************/ 
void nearestNeighbor(int inNode, unsigned long &totalDist, vector<cityType> &map, vector<int> &tour) {	

	int i, j, visit, curNode, nearestNode;
	unsigned long tempDist, closestDist, myTotalDist = 0;	
	vector<cityType> not_visited = map;
	vector<int> myTour; 
	
	//set all cities to false for visited status
	for(i = 0; i < not_visited.size(); i++) {
		not_visited[i].visited = false; 
	}

	not_visited[inNode].visited = true; //set starting city visited to true
	myTour.push_back(not_visited[inNode].id); //add starting city to map
	
	curNode = inNode; //set current node to starting node
	
	visit = not_visited.size() - 1; //get size of map
	
 	while(visit > 0) { //loop through all cities
	
		closestDist = numeric_limits<int>::max(); //set upper bound for closest distance
			
		for(j = 0; j < not_visited.size(); j++) { //loop through all cities
			
			if(not_visited[j].visited == false) { //if we have not visited that city
					tempDist = calcDistance(not_visited[j], not_visited[curNode]); //calculate the distance between city and our currnent city
					if(tempDist < closestDist) { 
						closestDist = tempDist;
						nearestNode = j;
					}
				}
		}
	
		not_visited[nearestNode].visited = true; //mark that node as visited
		myTour.push_back(not_visited[nearestNode].id); //mark down that note on tour list
		curNode = nearestNode; //assign current node to the nearest node
		myTotalDist += closestDist; //add the distance to total distance
		visit--; 
		
	}

	myTotalDist += calcDistance(not_visited[nearestNode], not_visited[inNode]); //go from final node to starting node
	tour = myTour;
	totalDist = myTotalDist;

	return; 
}



/****************************************************************************************
 ** Function: readinfo
 ** Description: reads cities info from input file
 ** Parameters: argv, vector of cities
 ***************************************************************************************/ 
 int readinfo(string filename, vector<cityType> &map) {
 
	int xcoord, ycoord, citynum;
	
    //declare an input stream from command line
    ifstream ifs(filename);
    //exit gracefully if this fails
    if (ifs.fail()) {
        cout << "Opening the file failed" << endl;
        exit(1);
    }


    //keep reading while there is input
    while(ifs.good()) { //same as while(ifs) cplusplus.com
    	
        ifs >> citynum >> xcoord >> ycoord;
    
		if(citynum >= 0 && xcoord >= 0 && ycoord >= 0) {
    
			//create new city
			cityType newCity;

			//give it the id of line number
			newCity.id = citynum;
			//give that city an x coordinate from file
			newCity.x = xcoord;
			//give that city a y coordinate from file
			newCity.y = ycoord;
			
			//add to vector
			map.push_back(newCity);
			
			citynum = -1;
			xcoord = -1;
			ycoord = -1;

			//TESTING PURPOSES ONLY
		   // cout << citynum << " " << xcoord << " " << ycoord << endl;
	   }

    }
	

 }

 /****************************************************************************************
 ** Function: print_usage()
 ** Description: print the usage
 ** Parameters: None
 ***************************************************************************************/ 
void print_usage() {
 		cout << "Usage:" << endl;
		cout << "\t  ./project4.cpp <filename> [-b]" << endl;
		cout << "\t  ./project4.cpp help" << endl;
		cout << "Options:" << endl;
		cout << "\t -c \t Run 2-opt algorithm: Cheapest Link Algorithm." << endl;
		exit(1);
}

/****************************************************************************************
 ** Function: sig_handler
 ** Description: ends program when SIGTERM signal is received
 ** Parameters: None
 ***************************************************************************************/ 
void signalHandler( int signum )
{		
    cout << "Termination signal (" << signum << ") received.\n";
		
    // terminate program 
    exit(signum);  

}

/****************************************************************************************
 ** Function: main()
 ** Description: find best tour it can
 ** Parameters: None
 ***************************************************************************************/ 
int main(int argc,  char** argv) {

	int citynum, objnum, i, opt;
	bool opt2 = false; 
	unsigned long shortestDist, totalDist;
	string filename; 
	vector<cityType> map;	/* nodes of the graph aka a vector of cityType structs*/
	vector<int> shortestTour, tour;	/* vector for holding the order of current tour, holds id's of cities */

	//assign max to shortestDist
	shortestDist = numeric_limits<int>::max();
	
	//check that we have the correct number of arguments
	if(argc < 2) {
		print_usage();
	}
	
	filename = argv[1]; //assign filename
	
	if(filename == "help") {
		print_usage();
	}	
	
	//process optional flag to see if 2-opt algorithm should be run
	while((opt = getopt(argc, argv, "c")) != -1) {
		switch(opt) {
			case 'c':
				opt2 = true;
				break;
			case '?':
			default:
				print_usage();
				break;	
		}
	}
	
	if(!opt2) {
		//call function to read the file and put the info into our vector
		readinfo(filename, map);
			
		//get number of objects in vector
		objnum = map.size();
		
		//for every city as start run nearest neighbor
		for (i = 0; i < objnum; i++) {
			nearestNeighbor(i, totalDist, map, tour);
			if(totalDist < shortestDist) {
				shortestDist = totalDist;
				shortestTour = tour; 
				cout << shortestDist << endl;
			}
		}

		//write results out to file
		output(filename, shortestDist, shortestTour);
	
		cout << shortestDist << endl;
	}
	else {
		
	
	}
	
    return 0;
}