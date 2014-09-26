/********************************************************************* 
 ** Program Filenames: Human.h
 ** Description: Human class
 *********************************************************************/ 
#ifndef HUMAN_H
#define HUMAN_H

#include <iostream>
#include <string>
#include <random>
#include <ctime>
#include "Creature.h"
 using namespace std;

 class Human : public Creature {

public:

	Human();
	Human(int newStrength, int newHit);

	//redefined function getSpecies()
	string getSpecies();	
	//redefined function getDamage()
	void getDamage();

private:
//none

 };

 /********************************************************************* 
 ** Description: Implementation file for Human class
 *********************************************************************/

/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default creature with 10 strength and 10
 ** hitpoints by utilizing the constructor in Creature class
 ** Parameters: None
 *********************************************************************/
Human::Human() : Creature() {
 	//intentionally left empty
}

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the overloaded constructor in Creature to create
 ** a human object with programmer inputted strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
Human::Human(int newStrength, int newHit) : Creature(newStrength, newHit) {
 	//intentionally left empty
}

/********************************************************************* 
 ** Function: getSpecies (redefined)
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Human::getSpecies() {
	return "Human";	
}

/********************************************************************* 
 ** Function: getDamage (redefined)
 ** Description: Outputs the damage of the human as a random number
 ** between the human's strength and 1.
 ** Parameters: None
 *********************************************************************/
void Human::getDamage() {
	int damage;
	//seeds the random number generator with the system time expressed as a UNIX timestamp
	srand(time(NULL));
	damage = (rand()%getStrength()) + 1;
	cout << "Damage is " << damage << endl;
}


 #endif