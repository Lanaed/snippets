/********************************************************************* 
 ** Program Filenames: Balrog.h
 ** Description: Balrog class
 *********************************************************************/ 
#ifndef BALROG_H
#define BALROG_H

#include <iostream>
#include <string>
#include "Demon.h"
#include <ctime>
#include <random>

 using namespace std;

 class Balrog : public Demon {

public:

	Balrog();
	Balrog(int newStrength, int newHit);

	//redefined function getSpecies()
	string getSpecies();
	//redefined function getDamage()
 	void getDamage();

private:


 };

 /********************************************************************* 
 ** Description: Implementation file for Balrog class
 *********************************************************************/
 
/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default Balrog with 10 strength and 10
 ** hitpoints by utilizing the constructor in Demon class
 ** Parameters: None
 *********************************************************************/
 Balrog::Balrog() : Demon() {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the overloaded constructor in Demon to create
 ** a Balrog object with programmer inputted strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
 Balrog::Balrog(int newStrength, int newHit) : Demon(newStrength, newHit) {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Function: getSpecies (redefined)
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Balrog::getSpecies() {
	return "Balrog";	
}

/********************************************************************* 
 ** Function: getDamage (redefined)
 ** Description: Outputs the damage of the Balrog as a random number
 ** between the demons strength and 1. 5% of the time inflict an 
 ** extra 50 points of damage
 ** Parameters: None
 *********************************************************************/
 void Balrog::getDamage() {
 	int damage;
 	int damage2;
 	srand(time(NULL));
 	damage = (rand()%getStrength()) + 1;
 	damage2 = (rand()%getStrength()) + 1;
 	damage = damage + damage2;
 	cout << "Ballrog speed attack inflicts another " << damage2 << " damage" << endl;
 	cout << "Total Damage is " << damage << endl;
 }

 #endif

