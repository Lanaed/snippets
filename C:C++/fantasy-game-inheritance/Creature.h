/********************************************************************* 
 ** Program Filenames: Creature.h
 ** Description: Creature class
 *********************************************************************/ 
#ifndef CREATURE_H
#define CREATURE_H

#include <iostream>
#include <string>
#include <random>
#include <ctime>
 using namespace std;

 class Creature {

public:

	//constructors
	Creature();
	Creature(int newStrength, int newHit);

	//mutators and accessors
	string getSpecies();
	int getStrength();
	int getHitpoints();
	void setStrength(int newStrength);
	void setHitpoints(int newHit);

	void getDamage();

private:

	int strength; //how much damage creature can inflict
	int hitpoints; //how much damage creature can sustain

 };

 /********************************************************************* 
 ** Description: Implementation file for Creature class
 *********************************************************************/

/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default creature with 10 strength and 10
 ** hitpoints
 ** Parameters: None
 *********************************************************************/
Creature::Creature() {
	strength = 10;
	hitpoints = 10;
}

/********************************************************************* 
 ** Constructor: Overloaded Constructor
 ** Description: Creates a creature with set strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
Creature::Creature(int newStrength, int newHit) {
	strength = newStrength;
	hitpoints = newHit;
}

/********************************************************************* 
 ** Function: getSpecies
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Creature::getSpecies() {
	return "Undefined Creature";	
}

/********************************************************************* 
 ** Function: getStrength
 ** Description: Returns the strength of the creature
 ** Parameters: none
 *********************************************************************/
int Creature::getStrength() {
	return strength;
}

/********************************************************************* 
 ** Function: getHitpoints
 ** Description: Returns the hitpoints of the creature
 ** Parameters: none
 *********************************************************************/
int Creature::getHitpoints() {
	return hitpoints;
}

/********************************************************************* 
 ** Function: setStrength
 ** Description: Sets the strength of the creature
 ** Parameters: int newStrength
 *********************************************************************/	
void Creature::setStrength(int newStrength) {
	strength = newStrength;
}

/********************************************************************* 
 ** Function: setHitpoints
 ** Description: Sets the hitpoints of the creature
 ** Parameters: int newHit
 *********************************************************************/
void Creature::setHitpoints(int newHit) {
	hitpoints = newHit;
}

/********************************************************************* 
 ** Function: getDamage
 ** Description: Outputs the damage the creature inflicts to the console,
 ** in this case the creature has not been defined, so if the programmer
 ** tries to call this function with creature, they are notified that
 ** this is illegal and the program exits
 ** Parameters: none
 *********************************************************************/
void Creature::getDamage() {
	cout << "ERROR creature is undefined! EXITING" << endl;
	exit(1);
}


 #endif