/********************************************************************* 
 ** Program Filenames: Employee.h
 ** Description: Employee class
 *********************************************************************/ 

#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#include <string>
#include <cstdlib>
#include <iostream>
 using namespace std;

 class Employee{

 public:
 	Employee();
 	Employee(const string& theName, const string& theSsn);
 	string getName() const;
 	string getSsn() const;
 	double getNetPay() const;
 	void setName(const string& newName);
 	void setSsn(const string& newSsn);
 	void setNetPay(double newNetPay);
 	void printCheck() const;
 private:
 	string name;
 	string ssn;
 	double netPay;
 };

 /********************************************************************* 
 ** Description: Implementation file for Employee class
 *********************************************************************/

Employee::Employee() : name("No name yet"), ssn("No number yet"), netPay(0) {
	//deliberately empty
}

Employee::Employee(const string& theName, const string& theNumber) : name(theName), ssn(theNumber), netPay(0) {
	//deliberately empty
}

string Employee::getName() const {
	return name;
}

string Employee::getSsn() const {
	return ssn;
}

double Employee::getNetPay() const {
	return netPay;
}

void Employee::setName(const string& newName) {
	name = newName;
}

void Employee::setSsn(const string& newSsn) {
	ssn = newSsn;
}

void Employee::setNetPay(double newNetPay) {
	netPay = newNetPay;
}

void Employee::printCheck() const {
	cout << "\nError: printCheck FUNCTION CALLED FOR AN \n"
		 <<	"UNDIFFERENTIATED EMPLOYEE. Aborting the program. \n"
		 << "Check with the author of the program about this bug. \n";
		 exit(1);
}

 #endif 

