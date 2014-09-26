/********************************************************************* 
 ** Program Filenames: SalariedEmployee.h
 ** Description: SalariedEmployee class
 *********************************************************************/ 
#ifndef SALARIEDEMPLOYEE_H
 #define SALARIEDEMPLOYEE_H

#include <iostream>
 #include <string>
#include "Employee.h"
using namespace std;

class SalariedEmployee : public Employee {

public:
	SalariedEmployee();
	SalariedEmployee(const string& theName, const string& theSsn, double theWeeklySalary);
	double getSalary() const;
	void setSalary(double newSalary);
	void printCheck();
private:
	double salary; //weekly
};

 /********************************************************************* 
 ** Description: Implementation for SalariedEmployee class
 *********************************************************************/ 

SalariedEmployee::SalariedEmployee() : Employee(), salary(0) {
	//deliberately left empty
}

SalariedEmployee::SalariedEmployee(const string &theName, const string &theNumber, double theWeeklyPay)
	 : Employee(theName, theNumber), salary(theWeeklyPay) {
	//deliberately left empty
}

double SalariedEmployee::getSalary() const {
	return salary;
}

void SalariedEmployee::setSalary(double newSalary) {
	salary = newSalary;
}

void SalariedEmployee::printCheck() {
	setNetPay(salary);
	cout << "\n_________________________________________\n";
	cout << "Pay to the order of " << getName() << endl;
	cout << "The sum of " << getNetPay() << " Dollars\n";
	cout << "_________________________________________\n";
	cout << "Check Stub NOT NEGOTIABLE \n";
	cout << "Employee number: " << getSsn() << endl;
	cout << "Salaried Employee. Regular Pay: " << salary << endl;
	cout << "_________________________________________\n";
}

 #endif