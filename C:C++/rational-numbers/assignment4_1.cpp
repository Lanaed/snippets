/********************************************************************* 
 ** Program Filenames: assignment4_1.cpp
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: driver (tester) function for #1 (same file as lab #2)
 ** Input: User enter two rational numbers in the form n/d
 ** Output: Display default constructor on object x, tests and prints
 ** overloaded operators >>, <<, -, +, *, /, >, >=, <, <=, == for Rational
 ** class. Shows normalize function working. 
 *********************************************************************/ 

 #include <iostream>
 #include "Rational.h"
 using std::cout;
 using std::cin;
 using std::endl;

 int main() {

 	//create 3 objects (rational numbers) from Rational class
 	Rational q;
 	Rational z;
 	//this is the deafult
 	Rational x;
 	//print the default for show (0/0)
 	cout << x << endl;

 	//use overloaded >> to set numerator and denominator for q and z
 	cout << "Enter a rational number (n/d)" << endl;
 	cin >> q;
 	cout << "Enter a rational number (n/d)" << endl;
 	cin >> z;

   //printing them off to test it worked
 	cout << "First number: " << q << endl;
 	cout << "Second Number: " << z << endl;

   //testing -
 	cout << "Testing overloaded operator - : " << endl;
 	x = q-z;
 	cout << q << "-" << z << "=" << x << endl;

   //testing +
 	cout << "Testing overloaded operator + : " << endl;
 	x = q+z;
 	cout << q << "+" << z << "=" << x << endl;

   //testing *
 	cout << "Testing overloaded operator * : " << endl;   
 	x = q*z;
 	cout << q << "*" << z << "=" << x << endl;

   //testing /
 	cout << "Testing overloaded operator / : " << endl;   
 	x = q/z;
 	cout << q << "/" << z << "=" << x << endl;

   //testing ==
 	cout << "Testing overloaded operator == : is (q==z)?" << endl;   
   cout << q << ((q==z) ? "==" : "!=") << z << endl; //if true == is displayed, if false != is displayed

  // testing >
   cout << "Testing overloaded operator > : is (q>z)?" << endl;      
   cout << q << ((q>z) ? ">" : "<=") << z << endl;

  //testing >=
   cout << "Testing overloaded operator >= : is (q>=z)?" << endl;   
   cout << q << ((q>=z) ? ">=" : "<") << z << endl;

  //testing <
   cout << "Testing overloaded operator < : is (q<z)?" << endl;    
   cout << q << ((q<z) ? "<" : ">=") << z << endl;

  //testing <=
   cout << "Testing overloaded operator <= : is (q<=z)? " << endl;   
   cout << q << ((q<=z) ? "<=" : ">") << z << endl;

   return 0;
}
