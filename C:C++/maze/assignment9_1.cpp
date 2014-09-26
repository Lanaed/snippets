/********************************************************************* 
 ** Program Filenames: assignment9_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/14/14

 ** Description: Chapter 17, Programming Project 11 + modifications
 **
 ** The following figure is called a graph. The circles are called nodes and the lines are called edges. An 
 ** edge connects two nodes. You can interpret the graph as a maze of rooms and passages. The nodes 
 ** can be thought of as rooms and an edge connects one room to another. Note that each node has at most 
 ** four edges in the following graph. 
 ** See page 822 for the diagram. 
 
 ** Write a program that implements the previous maze using references to instances of a Node class. Each 
 ** node in the graph will correspond to an instance of Node . The edges correspond to links that connect 
 ** one node to another and can be represented in Node as instance variables that reference another Node 
 ** class. Start the user in node A. The user’s goal is to reach the finish in node L. The program should 
 ** output possible moves in the north, south, east, or west direction. Sample execution is shown next. 

 ** Input: user choices for north, south west, east
 ** Output: current node, error messages, breadcrumbs and message upon completion
 *********************************************************************/

#include <iostream>
#include <vector>
 using namespace std;

/********************************************************************* 
 ** class: Node
 ** Description: Creates nodes which can be used to create a list link.
 ** Each node has 4 pointers.
 *********************************************************************/
 class Node {

 public:
 	Node() {}
 	Node(char theData, Node* theWest, Node* theEast, Node* theNorth, Node* theSouth) : data(theData), east(theEast), west(theWest), north(theNorth), south(theSouth) {};

 	Node* getEast() const {return east;}
 	Node* getWest() const {return west;}
 	Node* getNorth() const {return north;}
 	Node* getSouth() const {return south;}


 	char getData() const {return data;};
 	void setData(char theData) {data = theData;}

 	void setEast(Node* pointer) {east = pointer;}
 	void setWest(Node* pointer) {west = pointer;}
 	void setNorth(Node* pointer) {north = pointer;}
 	void setSouth(Node* pointer) {south = pointer;}

 private:
 	char data;
 	Node *east;
 	Node *west;
 	Node *north;
 	Node *south;
 };
 typedef Node* NodePtr;

 int main() {

	//create my two pointers for creating maze
 	NodePtr tempPtr;
 	NodePtr headPtr;

	//pointers for start and finish of maze
 	NodePtr finishPtr;
 	NodePtr startPtr;
	//pointer for special node g
 	NodePtr gPointer;

	//create the maze

	//create L
 	tempPtr = new Node('L', NULL, NULL, NULL, NULL);
	//set the finish
 	finishPtr = tempPtr;
 	headPtr = tempPtr;

	//insert H into the maze
 	tempPtr = new Node('H', NULL, NULL, NULL, headPtr);
 	headPtr->setNorth(tempPtr);
 	headPtr = tempPtr;

	//insert G into the maze
 	tempPtr = new Node('G', NULL, headPtr, NULL, NULL);
 	gPointer = tempPtr;
 	headPtr->setWest(tempPtr);
 	headPtr = tempPtr;

	//insert K into the maze
 	tempPtr = new Node('K', NULL, NULL, headPtr, NULL);
 	headPtr->setSouth(tempPtr);

	//insert C into the maze
 	tempPtr = new Node('C', NULL, NULL, NULL, headPtr);
 	headPtr->setNorth(tempPtr);
 	headPtr = tempPtr;	

	//insert D into the maze
 	tempPtr = new Node('D', headPtr, NULL, NULL, NULL);
 	headPtr->setEast(tempPtr);
 	headPtr = gPointer;

	//insert F into the maze
 	tempPtr = new Node('F', NULL, headPtr, NULL, NULL);
 	headPtr->setWest(tempPtr);
 	headPtr = tempPtr;	

	//insert B into the maze
 	tempPtr = new Node('B', NULL, NULL, NULL, headPtr);
 	headPtr->setNorth(tempPtr);
 	headPtr = tempPtr;

	//insert A into the maze
 	tempPtr = new Node('A', NULL, headPtr, NULL, NULL);
	//set A as start
 	startPtr = tempPtr;
 	headPtr->setWest(tempPtr);
 	headPtr = tempPtr;

	//insert E into the maze
 	tempPtr = new Node('E', NULL, NULL, headPtr, NULL);
 	headPtr->setSouth(tempPtr);
 	headPtr = tempPtr;

	//insert I into the maze
 	tempPtr = new Node('I', NULL, NULL, headPtr, NULL);
 	headPtr->setSouth(tempPtr);
 	headPtr = tempPtr;

	//insert J into the maze
 	tempPtr = new Node('J', headPtr, NULL, NULL, NULL);
 	headPtr->setEast(tempPtr);
 	headPtr = tempPtr;

	//have finished constructing the linked list maze

	//for the user choice of direction
 	char userChoice;

	//create a pointer for iterating through
 	NodePtr loopPtr;
	//set to start
 	loopPtr = startPtr;

	//create a vector to store the list of rooms you've been in
 	vector <char> breadcrumbs;
	//add the room to the list of breadcrumbs
 	breadcrumbs.push_back(loopPtr->getData());

	//gameplay while loop
	while (loopPtr != finishPtr) { //while they havent reached the end of the maze

		//print the node they are at
		cout << "You are at: " << loopPtr->getData() << endl;

		//prompt with directions which depend on if the pointers are null or not
		cout << "You may go: ";
		if(loopPtr->getWest() != NULL) {
			cout << " west ";
		}
		if(loopPtr->getEast() != NULL) {
			cout << " east ";
		}
		if(loopPtr->getNorth() != NULL) {
			cout << " north ";
		}
		if(loopPtr->getSouth() != NULL) {
			cout << " south ";
		}
		cout << endl;

		//have the user enter their choice
		cout << "Enter your direction [w, e, n, s]" << endl;
		cin >> userChoice;

		switch (userChoice) {

			//west
			case 'w':
			if (loopPtr->getWest() != NULL) { //check to make sure its not null and actually points somewhere
				loopPtr = loopPtr->getWest(); //traverse to next node
				breadcrumbs.push_back(loopPtr->getData()); //add the node to the breadcrumb vector
			}
			else {
				cout << "You didnt select a valid choice so you haven't moved" << endl;
			}		
			break;

			//east
			case 'e':
			if (loopPtr->getEast() != NULL) {
				loopPtr = loopPtr->getEast();
				breadcrumbs.push_back(loopPtr->getData()); 
			}
			else {
				cout << "You didnt select a valid choice so you haven't moved" << endl;
			}				
			break;

			//north
			case 'n':
			if (loopPtr->getNorth() != NULL) {
				loopPtr = loopPtr->getNorth();
				breadcrumbs.push_back(loopPtr->getData()); 
			}
			else {
				cout << "You didnt select a valid choice so you haven't moved" << endl;
			}				
			break;

			//south
			case 's':
			if (loopPtr->getSouth() != NULL) {
				loopPtr = loopPtr->getSouth(); 
				breadcrumbs.push_back(loopPtr->getData());
			}
			else {
				cout << "You didnt select a valid choice so you haven't moved" << endl;
			}			
			break;

			default:
			cout << "You didnt select a valid choice so you haven't moved" << endl;
			break;
		}

 	//Your current breadcrumbs
		cout << "List of rooms you've been in:" << endl;
		for (auto i = breadcrumbs.begin(); i != breadcrumbs.end(); i++) {
			cout << *i << " ";
		}
		cout << endl;

 } //end of while loop (exit if loopPtr = finishPtr)

 cout << "Congrats you finished the maze" << endl;

 //Your current breadcrumbs
		cout << "Final list of rooms you've been in:" << endl;
		for (auto i = breadcrumbs.begin(); i != breadcrumbs.end(); i++) {
			cout << *i << " ";
		}
		cout << endl;

 return 0;
}