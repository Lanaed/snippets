/********************************************************************* 
 ** Program Filenames: Rational.h
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: Chapter 8, programming project 2. Define a class for
 ** rational numbers. Represent rational numbers as two values of type
 ** int, one for the numerator and one for the denominator. Call the
 ** class rational. Include a constructor with two arguments that can be
 ** used to set the member variables of an object to any legitimate
 ** values. Also include a constructor that has only a single parameter
 ** of type int; call this single paramter wholeNumber and define the 
 ** constructor so the object will be initialized to the rational number
 ** whole/number/1. Include a default constructor that initializes an object
 ** to 0. Overload the input and output operators >> and <<. Numbers are to
 ** be input and output in the form 1/2, 15/32 and so fourth... Overload
 ** all the followng operators so they correctly apply to the type
 ** Rational: ==, <, <=, >, >=, +, -, * and /. Write a test program to test
 ** your rational numbers (Lab #1). You should include a function to normalize 
 ** the values stored so that, after normalization, the denominator is positive
 ** and the numerator and denominator are as small as possible.
 ** Input: n/a
 ** Output: n/a (shown in driver class)
 *********************************************************************/

#ifndef class_h
#define class_h
#include <string>
#include <cstdlib>
 using namespace std;

 class Rational {

 private:
 	//variables to hold the numerator and denominator of each rational number
 	int numerator;
 	int denominator;

 public:

  //constructor with two arguments that can be used to set the member variables of an object to any legit values
 	Rational(int num1, int num2);
  //constructor with single paramter of type int; call this single paramter wholeNumber
 	Rational(int wholeNumber);
  //defualt constructor
 	Rational();

 	//normalizes values
 	void normalize(int& numerator, int& denominator);

 	//overloading << >> operator declarations
 	friend ostream& operator<<(ostream &outs, const Rational& foo);
 	friend istream& operator >>(istream&, Rational&);

 	//overloading + - * / operator declarations 
 	friend const Rational operator-(const Rational&, const Rational&);
 	friend const Rational operator+(const Rational&, const Rational&);
 	friend const Rational operator*(const Rational&, const Rational&);
 	friend const Rational operator/(const Rational&, const Rational&);

 	//overloading == < <= > >= operator declarations
 	friend bool operator ==(const Rational&, const Rational&);
 	friend bool operator <(const Rational&, const Rational&);
 	friend bool operator <=(const Rational&, const Rational&);
 	friend bool operator >(const Rational&, const Rational&);
 	friend bool operator >=(const Rational&, const Rational&);

 };

/********************************************************************* 
 ** Constructor: Overloaded for two integers
 ** Parameters: int num1, int num2
 *********************************************************************/ 
 Rational::Rational(int num1, int num2) {
 	//checks to make sure second number is not 0
 	if (num2 == 0) {
 		cout << "Illegal! Thats not a rational number, changed denominator to 1 for you" << endl;
 		num2 = 1;
 	}
 	//calls to the normalize function to reduce values
 	normalize(num1, num2);
 	numerator = num1;
 	denominator = num2;
 }

/********************************************************************* 
 ** Constructor: Overloaded for one integer
 ** Parameters: int wholeNumber
 *********************************************************************/
 Rational::Rational(int wholeNumber) {
 	numerator = wholeNumber;
 	denominator = 1;
 }

/********************************************************************* 
 ** Constructor: Default  
 ** Parameters: none (creates a 0/0 rational number), yes its illegal but works 
 *********************************************************************/
 Rational::Rational() {
 	numerator = 0;
 	denominator = 0;
 }

/********************************************************************* 
 ** Operator Overload: <<
 ** Parameters: ostream &outs, const Rational& foo
 *********************************************************************/
 ostream& operator<<(ostream &outs, const Rational& foo) {
 	outs << foo.numerator << "/" << foo.denominator;
 	return outs;
 }

/********************************************************************* 
 ** Operator Overload: >>
 ** Parameters: istream& in, Rational& right
 *********************************************************************/
istream& operator >>(istream& in, Rational& right) {
char ch;
in >> right.numerator >> ch >> right.denominator;
}

/********************************************************************* 
 ** Operator Overload: -
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 const Rational operator-(const Rational& LHS, const Rational& RHS) {
 	return (Rational(LHS.numerator * RHS.denominator - RHS.numerator * LHS.denominator, LHS.denominator * RHS.denominator));
 }

/********************************************************************* 
 ** Operator Overload: +
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 const Rational operator+(const Rational& LHS, const Rational& RHS) {
 	return Rational(LHS.numerator * RHS.denominator + RHS.numerator * LHS.denominator, LHS.denominator * RHS.denominator);
 }

/********************************************************************* 
 ** Operator Overload: *
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 const Rational operator*(const Rational& LHS, const Rational& RHS) {
 	return Rational(LHS.numerator * RHS.numerator, LHS.denominator * RHS.denominator);
 }

/********************************************************************* 
 ** Operator Overload: /
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 const Rational operator/(const Rational& LHS, const Rational& RHS) {
 	return Rational(LHS.numerator * RHS.denominator, LHS.denominator * RHS. numerator);
 }

/********************************************************************* 
 ** Operator Overload: ==
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 bool operator ==(const Rational& LHS, const Rational& RHS){
 	return LHS.numerator*RHS.denominator == RHS.numerator*LHS.denominator;
 }

/********************************************************************* 
 ** Operator Overload: >
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 bool operator >(const Rational& LHS, const Rational& RHS){
 	return LHS.numerator*RHS.denominator > RHS.numerator*LHS.denominator;
 }

/********************************************************************* 
 ** Operator Overload: >=
 ** Parameters: const Rational& LHS, const Rational& RHS 
 *********************************************************************/
 bool operator >=(const Rational& LHS, const Rational& RHS){
 	return LHS.numerator*RHS.denominator >= RHS.numerator*LHS.denominator;
 }

/********************************************************************* 
 ** Operator Overload: <
 ** Parameters: const Rational& LHS, const Rational& RHS 
 *********************************************************************/
 bool operator <(const Rational& LHS, const Rational& RHS){
 	return LHS.numerator*RHS.denominator < RHS.numerator*LHS.denominator;
 }

/********************************************************************* 
 ** Operator Overload: <=
 ** Parameters: const Rational& LHS, const Rational& RHS
 *********************************************************************/
 bool operator <=(const Rational& LHS, const Rational& RHS){
 	return LHS.numerator*RHS.denominator <= RHS.numerator*LHS.denominator;
 }

/********************************************************************* 
 ** Function: normalize
 ** Description: Adjusts for negatives, finds the greatest common divisor and
 ** adjust the numerator and denominator accordingly.
 ** Parameters: int& numerator, int& denominator 
 *********************************************************************/
 void Rational::normalize(int& numerator, int& denominator) {

 	//checking for negative values upon input
 	if ( numerator > 0 && denominator < 0 || numerator < 0 && denominator < 0 ) {
 		numerator = -numerator;
 		denominator = -denominator;
 	}

 	//see which is the greater, the numerator or denominator
 	int greatest;
 	if (numerator > denominator) {
 		greatest = numerator;
 	}
 	else {
 		greatest = denominator;
 	}

 	//finding the greatest common divisor
 	int greatestCommonDivisor = 0; 
 	for ( int i = 2; i <= greatest; i++ )
 		//this is the greatest common divisor
 		if ( numerator % i == 0 && denominator % i == 0 )
 			greatestCommonDivisor = i;
 		//adjust numerator and denominator accordingly
 		if (greatestCommonDivisor != 0){
 			numerator = numerator/greatestCommonDivisor; 
 			denominator = denominator/greatestCommonDivisor; 
 		}
 	}

#endif
