/********************************************************************* 
 ** Program Filenames: assignment6_2.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/16/14
 ** Description: Chapter 14 Programming project 9
 ** Input: none, rewriting a class with inheritance
 ** Output: showing the rewrite worked, and the new mutator functions
 ** are working properly
 *********************************************************************/ 

 #include <iostream>
 #include "Creature.h"
 #include "Human.h"
 #include "Demon.h"
 #include "Elf.h"
 #include "Balrog.h"
 #include "Cyberdemon.h"
 #include <random>
 #include <ctime>


using namespace std;

int main() {

	//create a creature (default)
	Creature c;
	cout << "Object is: " << c.getSpecies() << endl;
	cout << "Strength is " << c.getStrength() << endl;
	cout << "Hitpoints are: " << c.getHitpoints() << endl;
	//Create a human
	Human h(20, 120);
	cout << "Object is: " << h.getSpecies() << endl;
	cout << "Strength is: " << h.getStrength() << endl;
	cout << "Hitpoints are: " << h.getHitpoints() << endl;
	//Create an elf 
	Elf e(30, 30);
	cout << "Object is: " << e.getSpecies() << endl;
	cout << "Strength is: " << e.getStrength() << endl;
	cout << "Hitpoints are: " << e.getHitpoints() << endl;
	//Create a demon
	Demon d(50, 60);
	cout << "Object is: " << d.getSpecies() << endl;
	cout << "Strength is: " << d.getStrength() << endl;
	cout << "Hitpoints are: " << d.getHitpoints() << endl;
	//Create a Balrog

	//Create a cyberdemon
	Cyberdemon cy(100, 150);
	cout << "Object is: " << cy.getSpecies() << endl;
	cout << "Strength is: " << cy.getStrength() << endl;
	cout << "Hitpoints are: " << cy.getHitpoints() << endl;

	//Create a balrog
	Balrog b(32, 16);
	cout << "Object is: " << b.getSpecies() << endl;
	cout << "Strength is: " << b.getStrength() << endl;
	cout << "Hitpoints are: " << b.getHitpoints() << endl;

	cout << "\n";

	string userInput;
	string attackAgain = "1";
	bool playAgain = true;

	cout << "Now will show attack damages: " << endl;

	do {
		cout << "\n";

		//commented out because this will cause error
		//cout << "Creature attack";
		//c.getDamage();

		cout << "Human attack: ";	
		h.getDamage();

		cout << "\n";

		cout << "Elf attack: ";
		e.getDamage();

		cout << "\n";

		cout << "Demon attack: ";
		d.getDamage();

		cout << "\n";

		cout << "Cyberdemon attack: ";
		cy.getDamage();

		cout << "\n";

		cout << "Balrog attack: ";
		b.getDamage();

		cout << "\n";
		cout << "Again? Press [1] : Quit? Press [Anything else]: ";
		cin >> userInput;
		if (userInput == "1") {
			playAgain = true;
		}
		else
			playAgain = false;

	} while (playAgain == true);


	return 0;
}