/********************************************************************* 
 ** Program Filenames: Elf.h
 ** Description: Elf class
 *********************************************************************/ 
#ifndef ELF_H
#define ELF_H

#include <iostream>
#include <string>
#include "Creature.h"
#include <random>
#include <ctime>
 using namespace std;

 class Elf : public Creature {

 public:

 	Elf();
 	Elf(int newStrength, int newHit);

	//redefined function getSpecies()
	string getSpecies();
	//redefined function getDamage()
 	void getDamage();

 private:


 };

 /********************************************************************* 
 ** Description: Implementation file for Elf class
 *********************************************************************/

/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default elf with 10 strength and 10
 ** hitpoints by utilizing the constructor in Creature class
 ** Parameters: None
 *********************************************************************/
 Elf::Elf() : Creature() {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the overloaded constructor in Creature to create
 ** an elf object with programmer inputted strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
 Elf::Elf(int newStrength, int newHit) : Creature(newStrength, newHit) {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Function: getSpecies (redefined)
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Elf::getSpecies() {
	return "Elf";	
}

/********************************************************************* 
 ** Function: getDamage (redefined)
 ** Description: Outputs the damage of the elf as a random number
 ** between the elfs strength and 1. 10% of time inflict a magical
 ** attack worth twice the damage.
 ** Parameters: None
 *********************************************************************/
 void Elf::getDamage() {
 	int damage;
 	int extra = 0;
	//seeds the random number generator with the system time expressed as a UNIX timestamp
 	srand(time(NULL));
 	damage = (rand()%getStrength()) + 1;

	//elf special abilities
 	if ((rand()%10)==0) {
 		extra = damage; 
 		cout << "Magical attack inflicts " << extra << " additional damage points!" << endl; 
 		damage = damage + extra;
 	}
 	cout << "Damage is " << damage << endl;
 }

 #endif