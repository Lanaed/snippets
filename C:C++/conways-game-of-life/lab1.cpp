/*********************************************************************
 ** Program Filenames: lab1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 1/26/14
 ** Description: Conways Game of Life
 ** Input: user input for world choice, and # of regenerations
 ** Output: different generations of the world
 *********************************************************************/
#include <iostream>
 using std::cout;
 using std::cin;
 using std::endl;

//const ints to define the world array size
 const int ROWS = 22;
 const int COLS = 80;

 //const char for indicating dead or alive
 const char ALIVE = '*';
 const char DEAD = ' ';

//functions
 void displayInstructions();
 void initializeWorld(char World[][COLS], int ROWS, int COLS, char DEAD);
 void selectWorld(char World[][COLS]);
 void printWorld(char World[][COLS]);
 void initializeTemporaryWorld(int temporaryWorld[][COLS], int ROWS, int COLS);
 void countNeighbors(int i, int j, char World[][COLS], int temporaryWorld[][COLS]);
 void circleOfLife(int i, int j, int temporaryWorld[][COLS], char World[][COLS]);
 void world1(char World[][COLS], const char ALIVE);
 void world2(char World[][COLS], const char ALIVE);
 void world3(char World[][COLS], const char ALIVE);
 void world4(char World[][COLS], const char ALIVE);

 int main() {

	//create a 80x22 char array
 	char World[ROWS][COLS];

	//fill with empty spaces
 	initializeWorld(World, ROWS, COLS, DEAD);

	//Have the user select a pattern
 	displayInstructions();
 	selectWorld(World);

	//print and show them the pattern they chose
 	cout << "You picked this world: Generation 1" << endl;
 	printWorld(World);

	//create a temporary world to store # of neighbors each cell in array World has
 	int temporaryWorld[ROWS][COLS];
	//initialize to all 0's
 	initializeTemporaryWorld(temporaryWorld, ROWS, COLS);

	//set up variables for replaying and counting regenerations
 	int replay = -1;
 	bool regenerate = true;
 	int counter = 2;

	//start game
 	do {

	//count the neighbors of every cell in World and store in temporaryworld
 		for (int i = 0; i < ROWS; ++i) {
 			for (int j = 0; j < COLS; ++j) {
 				countNeighbors(i, j, World, temporaryWorld);
 			}
 		}

	//determine if the cell in World lives, dies, births depending on # of neighbors in temporary World
 		for (int i = 0; i < ROWS; ++i) {
 			for (int j = 0; j < COLS; ++j) {
 				circleOfLife(i, j, temporaryWorld, World);
 			}
 		}

	//print the new generation of World array
 		cout << "Generation: " << counter << endl;
 		printWorld(World); //prints world

	//Ask the user if they would like to see another generation
 		cout << "Regenerate? 1 for yes, anything else for no: ";
 		cin >> replay;
 		if (replay != 1) {
		//break the loop if they answer no (not 1)
 			break;
 		}
	//increment counter to keep track of generations
 		counter++;
 	} while (regenerate == true);

 	return 0;
 }

/*********************************************************************
 ** Function: initializeWorld
 ** Description: initializes char array World to all empty spaces
 ** Parameters: char array World, int rows, int columns, char DEAD
 *********************************************************************/
 void initializeWorld(char World[][COLS], int ROWS, int COLS, char DEAD) {
 	for (int i = 0; i < ROWS; ++i) {
 		for (int j = 0; j < COLS; ++j) {
      World[i][j] = DEAD;   //fill with empty spaces
  		}
	}
}

void displayInstructions() {
	cout << "Hello user, welcome to Conways Game of Life, please select your world" << endl;
	cout << "[1] For a static spaceship (kind of boring)" << endl;
	cout << "[2] For a small colony that grows larger" << endl;
	cout << "[3] For rows of 3 that oscilate, to check the algorithm" << endl;
	cout << "[4] For a pulsar" << endl;
}
/*********************************************************************
 ** Function: selectWorld
 ** Description: prompts the user to select a world by selecting an
 ** integer value. Uses a switch::case statement to select the world.
 ** Calls, world1, world2... methods depending on selection.
 ** Parameters: char array World
 *********************************************************************/
 void selectWorld(char World[][COLS]) {
 	cout << "select a world" << endl;
 	int userChoice;
 	cin >>userChoice;

 	switch (userChoice) {

 		case 1:
 		cout << "You selected world 1" << endl;
 		world1(World, ALIVE);
 		break;

 		case 2:
 		cout << "You selected world 2" << endl;
 		world2(World, ALIVE);
 		break;

 		case 3:
 		cout << "You selected world 3" << endl;
 		world3(World, ALIVE);
 		break;

 		case 4:
 		cout << "You selected world 4" << endl;
 		world4(World, ALIVE);
 		break;

 		default:
 		//pick world 3 if they dont choose a valid input
 		cout << "You didnt select a world, so picking world 3" << endl;
 		world3(World, ALIVE);
 		break;
 	}
 }

/*********************************************************************
 ** Function: printWorld
 ** Description: prints the array World
 ** Parameters: char array World
 *********************************************************************/
 void printWorld(char World[][COLS]) {
 	for (int i = 0; i < ROWS; ++i) {
 		for (int j = 0; j < COLS; ++j) {
 			cout << World[i][j];
 		}
    cout << "\n"; //...not needed because the world dimensions are the same as the console
 	}
 }

/*********************************************************************
 ** Function: initializeTemporaryWorld
 ** Description: initializes a temporary world that will store the number of
 ** neighbors that each cell in the World array has.
 ** Parameters: int array temporaryWorld, int rows, int cols
 *********************************************************************/
 void initializeTemporaryWorld(int temporaryWorld[][COLS], int ROWS, int COLS) {
 	for (int i = 0; i < ROWS; ++i) {
 		for (int j = 0; j < COLS; ++j) {
      temporaryWorld[i][j] = 0;   //fill with o
  }
}
}

/*********************************************************************
 ** Function: countNeighbors()
 ** Description: Counts the # of neighbors around a cell in the char array
 ** World. Sets the # of neighbors into the mirror cell in the int
 ** array temporaryWorld. Uses % algorithm to account for edge conditions
 ** Parameters: int i, int j, char World array, int temporaryWorld array
 *********************************************************************/
 void countNeighbors(int i, int j, char World[][COLS], int temporaryWorld[][COLS]) {

 	int neighbors = 0;

			//upper left of cell
 	if (World[(i-1+ROWS)%ROWS][(j-1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//directly above cell
 	if (World[(i-1+ROWS)%ROWS][j] == ALIVE)
 		neighbors++;

			//upper right of cell
 	if (World[(i-1+ROWS)%ROWS][(j+1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//left of cell
 	if (World[i][(j-1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//right of cell
 	if (World[i][(j+1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//down left of cell
 	if (World[(i+1+ROWS)%ROWS][(j-1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//directly below cell
 	if (World[(i+1+ROWS)%ROWS][j] == ALIVE)
 		neighbors++;

			//down right of cell
 	if (World[(i+1+ROWS)%ROWS][(j+1+COLS)%COLS] == ALIVE)
 		neighbors++;

			//set the temporary world value at i,j to the amount of neighbors it has
 	temporaryWorld[i][j] = neighbors;
 }

/*********************************************************************
 ** Function: circleOfLife()
 ** Description: determines if a cell in char array World will die, survive
 ** or give birth depending on its # of neighbors during a generation
 ** change
 ** Parameters: int i, int j, int temporaryWorld array, int World array
 *********************************************************************/

 void circleOfLife(int i, int j, int temporaryWorld[][COLS], char World[][COLS]) {
 	//more than 3 neibhors die of overcrowding
 	if (temporaryWorld[i][j] > 3)
 		World[i][j] = DEAD;

 	//1 or less neighbors die of loneliness
 	else if (temporaryWorld[i][j] <= 1)
 		World[i][j] = DEAD;

 	//touching 3 than grow a *
 	else if (temporaryWorld[i][j] == 3)
 		World[i][j] = ALIVE;
 }

/*********************************************************************
 ** Functions: world1, world2, world3
 ** Description: Hard coded worlds that the user can select
 ** Parameters: char array World, char ALIVE
 *********************************************************************/

//static spaceship
 void world1(char World[][COLS], const char ALIVE) {

 	World[0][4] = ALIVE; World[0][5] = ALIVE; World[0][12] = ALIVE; World[0][13] = ALIVE;
 	World[1][3] = ALIVE; World[1][5] = ALIVE; World[1][12] = ALIVE; World[1][14] = ALIVE;
 	World[2][3] = ALIVE; World[2][14] = ALIVE; World[3][0] = ALIVE; World[3][1] = ALIVE;
 	World[3][3] = ALIVE; World[3][14] = ALIVE; World[3][16] = ALIVE; World[3][17] = ALIVE;
 	World[4][0] = ALIVE; World[4][1] = ALIVE; World[4][3] = ALIVE; World[4][5] = ALIVE;
 	World[4][8] = ALIVE; World[4][9] = ALIVE; World[4][12] = ALIVE; World[4][14] = ALIVE;
 	World[4][16] = ALIVE; World[4][17] = ALIVE; World[5][3] = ALIVE; World[5][5] = ALIVE;
 	World[5][7] = ALIVE; World[5][10] = ALIVE; World[5][12] = ALIVE; World[5][14] = ALIVE;
 	World[11][4] = ALIVE; World[11][5] = ALIVE; World[11][12] = ALIVE; World[11][13] = ALIVE;
 	World[10][3] = ALIVE; World[10][5] = ALIVE; World[10][12] = ALIVE; World[10][14] = ALIVE;
 	World[9][3] = ALIVE; World[9][14] = ALIVE; World[8][0] = ALIVE; World[8][1] = ALIVE;
 	World[8][3] = ALIVE; World[8][14] = ALIVE; World[8][16] = ALIVE; World[8][17] = ALIVE;
 	World[7][0] = ALIVE; World[7][1] = ALIVE; World[7][3] = ALIVE; World[7][5] = ALIVE;
 	World[7][8] = ALIVE; World[7][9] = ALIVE; World[7][12] = ALIVE; World[7][14] = ALIVE;
 	World[7][16] = ALIVE; World[7][17] = ALIVE; World[6][3] = ALIVE; World[6][5] = ALIVE;
 	World[6][7] = ALIVE; World[6][10] = ALIVE; World[6][12] = ALIVE; World[6][14] = ALIVE;
 }

//random mess that grows into a colony
 void world2(char World[][COLS], const char ALIVE) {

 	World[0][0] = ALIVE;
 	World[1][0] = ALIVE;
 	World[2][0] = ALIVE;
 	World[2][2] = ALIVE;
 	World[2][3] = ALIVE;
 	World[2][4] = ALIVE;
 	World[2][7] = ALIVE;
 	World[10][10] = ALIVE;
 	World[11][10] = ALIVE;
 	World[12][10] = ALIVE;
 	World[12][12] = ALIVE;
 	World[12][13] = ALIVE;
 	World[12][14] = ALIVE;
 	World[12][17] = ALIVE;
 }

//lines of 3 to test algorithm is working properly, including edge conditions
 void world3(char World[][COLS], const char ALIVE) {

 	World[0][0] = ALIVE;
 	World[0][1] = ALIVE;
 	World[0][2] = ALIVE;

 	World[10][10] = ALIVE;
 	World[10][11] = ALIVE;
 	World[10][12] = ALIVE;

 	World[15][60] = ALIVE;
 	World[15][61] = ALIVE;
 	World[15][62] = ALIVE;

 	World[20][5] = ALIVE;
 	World[20][6] = ALIVE;
 	World[20][7] = ALIVE;

 	World[20][50] = ALIVE;
 	World[20][51] = ALIVE;
 	World[20][52] = ALIVE;
 }

//pulsar
 void world4(char World[][COLS], const char ALIVE) {

 	World[9][20] = ALIVE; World[10][20] = ALIVE; World[9][21] = ALIVE;
 	World[10][21] = ALIVE; World[7][33] = ALIVE; World[7][32] = ALIVE;
 	World[8][31] = ALIVE; World[9][30] = ALIVE; World[10][30] = ALIVE;
 	World[11][30] = ALIVE; World[12][31] = ALIVE; World[13][32] = ALIVE;
 	World[13][33] = ALIVE; World[10][34] = ALIVE; World[8][35] = ALIVE;
 	World[9][36] = ALIVE; World[10][36] = ALIVE; World[10][37] = ALIVE;
 	World[11][36] = ALIVE; World[12][35] = ALIVE; World[5][44] = ALIVE;
 	World[6][44] = ALIVE; World[6][42] = ALIVE; World[7][41] = ALIVE;
 	World[7][40] = ALIVE; World[8][40] = ALIVE; World[8][41] = ALIVE;
 	World[9][41] = ALIVE; World[9][40] = ALIVE; World[10][42] = ALIVE;
 	World[10][44] = ALIVE; World[11][44] = ALIVE; World[7][54] = ALIVE;
 	World[8][54] = ALIVE; World[7][55] = ALIVE; World[8][55] = ALIVE;
 }


