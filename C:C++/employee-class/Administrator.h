/********************************************************************* 
 ** Program Filenames: Administrator.h
 ** Description: Administrator class
 *********************************************************************/ 
#ifndef ADMINISTRATOR_H
 #define ADMINISTRATOR_H

#include <iostream>
 #include <string>
 #include "SalariedEmployee.h"
 using namespace std;

 class Administrator : public SalariedEmployee {

public:
 	Administrator();
 	Administrator(const string& theName, const string& theSsn, double theWeeklyPay, double theAnnualSalary, string theTitle, string theResponsibility, string theSupervisor);
 	//a member function called set supervisor which chnages supervisors name
 	void setSupervisor(string theSName);
 	//a member function for reading in an administrators data from the keyboard
 	void readInData();
 	//a member function called print which outputs the object's data to the screen
 	void print();
 	//an overloading of the member function printCheck() with appropriate notations on check
 	void printCheck();

protected:
	//a protected member variable fo type double that holds the administrators annual salary
	double annualSalary;

private:
	//a member variable of type string that holds the administrators title
	string title;
	//a member variable of type string that contains the company area of responsibility
	string responsibility;
	//a member variable of type string that holds the immediate supervisor
	string supervisor;

 };

 /********************************************************************* 
 ** Description: Implementation for Administrator class
 *********************************************************************/ 

/********************************************************************* 
 ** Constructor: Default
 ** Description: Uses the SalariedEmployee constructor to set name, Ssn,
 ** and weekly salary to 0. Sets title, resonsibility, and supervisor
 ** to default value.
 ** Parameters: none
 *********************************************************************/
Administrator::Administrator() 
	: SalariedEmployee(), annualSalary(0), title("title not defined yet"), responsibility("responsibility not defined yet"), supervisor("supervisor not defined yet") {
		//intentionally left blank
	}

/********************************************************************* 
 ** Constructor: Overloaded
 ** Description: Uses the SalariedEmployee overloaded constructor to
 ** set name, Ssn and weekly pay. Sets title, responsibility and 
 ** supervisor to thier respective private variables. 
 ** Parameters: const string& theName, const string& theNumber, double 
 ** theWeeklyPay, double theAnnualSalary, string theTitle, string 
 ** theResponsibility, string theSupervisor
 *********************************************************************/
Administrator::Administrator(const string& theName, const string& theNumber, double theWeeklyPay, double theAnnualSalary, string theTitle, string theResponsibility, string theSupervisor)
	:SalariedEmployee(theName, theNumber, theWeeklyPay), annualSalary(theAnnualSalary), title(theTitle), responsibility(theResponsibility), supervisor(theSupervisor) {
		//intentionally left blank
	}

/********************************************************************* 
 ** Function: setSupervisor
 ** Description: Sets the supervisor of object
 ** Parameters: string theSName
 *********************************************************************/
void Administrator::setSupervisor(string theSName) {
	supervisor = theSName;
}

/********************************************************************* 
 ** Function: readInData
 ** Description: Allows the user to enter data and set the value for 
 ** name, Ssn, weekly salary, annual salary, title, responsibility,
 ** and supervisor. 
 ** Parameters: none
 *********************************************************************/
void Administrator::readInData() {

	//variables to temporarily hold user data
	string userName;
	string userSsn;
	double userWeeklySalary;
	double userAnnualSalary;
	string userTitle;
	string userResponsibility;
	string userSupervisor;

	cout << "Enter new Administrator data below: " << endl;

	cout << "Name: ";
	cin >> userName;
	setName(userName); //have to set with function from Employee

	cout << "Ssn: ";
	cin >> userSsn;
	setSsn(userSsn); //have to set with function from Employee

	cout << "Weekly Salary: ";
	cin >> userWeeklySalary;
	setNetPay(userWeeklySalary); //have to set with function from Employee

	cout << "Annual Salary: ";
	cin >> userAnnualSalary;
	annualSalary = userAnnualSalary;

	cout << "Title: ";
	cin >> userTitle;
	title = userTitle;

	cout << "Responsibility: ";
	cin >> userResponsibility;
	responsibility = userResponsibility;

	cout << "Immediate supervisor: ";
	cin >> userSupervisor;
	supervisor = userSupervisor;
}

/********************************************************************* 
 ** Function: print
 ** Description: Prints the object data to the console
 ** Parameters: none
 *********************************************************************/
void Administrator::print() {
	cout << "Name of administrator is: " << getName() << endl; //have to use the functions to acces private variables in base class
	cout << "The Ssn of administrator is: " << getSsn() << endl;
	cout << "The weekly pay of the administrator is: " << getNetPay() << endl;
	cout << "The annual salary of the administrator is: " << annualSalary << endl;
	cout << "The title of the administrator is: " << title << endl;
	cout << "The responsibility of the administrator is: " << responsibility << endl;
	cout << "The immediate supervisor of the administrator is: " << supervisor << endl;
}

/********************************************************************* 
 ** Function: printCheck
 ** Description: Overloaded to print annual salary in a stub
 ** Parameters: none
 *********************************************************************/
 void Administrator::printCheck() {
 	setNetPay(annualSalary); //redefined with annual salary
	cout << "\n_________________________________________\n";
	cout << "Pay to the order of " << getName() << endl;
	cout << "The sum of " << getNetPay() << " Dollars\n";
	cout << "_________________________________________\n";
	cout << "Check Stub NOT NEGOTIABLE \n";
	cout << "Employee number: " << getSsn() << endl;
	cout << "Salaried Employee. Regular Pay: " << annualSalary << endl;
	cout << "_________________________________________\n";
}


#endif