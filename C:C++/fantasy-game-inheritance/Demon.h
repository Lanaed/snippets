/********************************************************************* 
 ** Program Filenames: Demon.h
 ** Description: Demon class
 *********************************************************************/ 
#ifndef DEMON_H
#define DEMON_H

#include <iostream>
#include <string>
#include "Creature.h"
#include <ctime>
#include <random>

 using namespace std;

 class Demon : public Creature {

 public:

 	Demon();
 	Demon(int newStrength, int newHit);

	//redefined function getSpecies()
	string getSpecies();
	//redefined function getDamage()
 	void getDamage();

 private:
//none

 };

 /********************************************************************* 
 ** Description: Implementation file for Demon class
 *********************************************************************/
/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default demon with 10 strength and 10
 ** hitpoints by utilizing the constructor in Creature class
 ** Parameters: None
 *********************************************************************/
 Demon::Demon() : Creature() {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the overloaded constructor in Creature to create
 ** an Demon object with programmer inputted strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
 Demon::Demon(int newStrength, int newHit) : Creature(newStrength, newHit) {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Function: getSpecies (redefined)
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Demon::getSpecies() {
	return "Demon";	
}

/********************************************************************* 
 ** Function: getDamage (redefined)
 ** Description: Outputs the damage of the demon as a random number
 ** between the demons strength and 1. 5% of the time inflict an 
 ** extra 50 points of damage
 ** Parameters: None
 *********************************************************************/
 void Demon::getDamage() {
 	int damage;
 	int extra;
 	srand(time(NULL));
 	damage = (rand()%getStrength()) + 1;

 	if ((rand()%100) < 5) { 
 		extra = damage + 50; 
 		cout << "Demonic attack inflicts 50 additional damage points!" << endl; 
 		damage = damage + extra;
 	} 
 	cout << "Damage is " << damage << endl;
 }

 #endif