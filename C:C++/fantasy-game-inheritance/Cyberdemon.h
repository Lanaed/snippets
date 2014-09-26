/********************************************************************* 
 ** Program Filenames: Cyberdemon.h
 ** Description: Cyberdemon class
 *********************************************************************/ 
#ifndef CYBERDEMON_H
#define CYBERDEMON_H

#include <iostream>
#include <string>
#include "Demon.h"

 using namespace std;

 class Cyberdemon : public Demon {

public:

	Cyberdemon();
	Cyberdemon(int newStrength, int newHit);

	//redefined function getSpecies()
	string getSpecies();

private:
//none

 };

 /********************************************************************* 
 ** Description: Implementation file for CyberCyberdemon class
 *********************************************************************/

/********************************************************************* 
 ** Constructor: Default
 ** Description: Creates a default Cyberdemon with 10 strength and 10
 ** hitpoints by utilizing the constructor in Demon class
 ** Parameters: None
 *********************************************************************/
 Cyberdemon::Cyberdemon() : Demon() {
 	//intentionally left empty
 }

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the overloaded constructor in Demon to create
 ** an Cyberdemon object with programmer inputted strength and hitpoints
 ** Parameters: int newStrength, int newHit
 *********************************************************************/
 Cyberdemon::Cyberdemon(int newStrength, int newHit) : Demon(newStrength, newHit) {
  	//intentionally left empty
 }

/********************************************************************* 
 ** Function: getSpecies (redefined)
 ** Description: Returns the type of creature
 ** Parameters: none
 *********************************************************************/
string Cyberdemon::getSpecies() {
	return "Cyberdemon";	
}
 #endif
