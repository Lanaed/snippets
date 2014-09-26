/********************************************************************* 
 ** Program Filenames: Vector2D.h
 ** Author: Ethan Spiro
 ** Class: CS 162
 ** Due Date: 2/2/14
 ** Description: Write the defnition for a class named Vector2D that
 ** stores information about a two-dimensional vector. The class should
 ** have functions to get and set the x and y components, where x and 
 ** y are integers. Overload the * operator so that it returns the dot
 ** product of two vectors. The dot product of two-dimensional vectors
 ** A and B is equal to (Ax * Bx)+(Ay * By). Write a main subroutine that
 ** tests the * operation.
 *********************************************************************/

#ifndef class_h
#define class_h
#include <string>
#include <vector>
#include <cstdlib>
#include <iterator>

 using namespace std;

 class Vector2Dtry2 {

 private:
  int x;  //for rows
  int y;  //for columns

public:

  //default constructor
  Vector2Dtry2(int num1, int num2);

  //setter and getters
  void setX(int num1);
  void setY(int num2);
  int getX();
  int getY();

//overloading * operator
friend const Vector2Dtry2 operator*(const Vector2Dtry2&, const Vector2Dtry2&);

};

//constructor, sets num1 and num2, default at 10
Vector2Dtry2::Vector2Dtry2(int num1 = 10, int num2 = 10) {
  x = num1;
  y = num2;
}

//setting x
void Vector2Dtry2::setX(int num1) {
  x = num1;
}

//setting y
void Vector2Dtry2::setY(int num2) {
  y = num2;
}

//getting x
int Vector2Dtry2::getX() {
  return x;
}

//getting y
int Vector2Dtry2::getY() {
  return y;
}

/********************************************************************* 
 ** Operator Overload: *
 ** Parameters: const Vector2Dtry2& LHS, const Vector2Dtry2& RHS
 *********************************************************************/
 const Vector2Dtry2 operator*(const Vector2Dtry2& LHS, const Vector2Dtry2& RHS) {
  return Vector2Dtry2((LHS.x * RHS.x) + (LHS.y * RHS.y));
 }

 #endif