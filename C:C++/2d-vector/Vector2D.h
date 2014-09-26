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
 ** Input: 
 ** Output: 
 *********************************************************************/

#ifndef class_h
#define class_h
#include <string>
#include <vector>
#include <cstdlib>
#include <iterator>

 using namespace std;

 class Vector2D {

 private:
  int x;  //for rows
  int y;  //for columns
  vector< vector<int> > v;  //2D vector v

public:

  //constructors
  Vector2D();
  Vector2D(int num_1, int num_2);


  //function declarations
  void printVector();
  int getVectorElement(int coordinate_1, int coordinate_2);
  void setVectorElement(int row, int col, int set);

  //overloading * operator
  friend const Vector2D operator*(const Vector2D&, const Vector2D&);

};


/********************************************************************* 
 ** Constructor: overloaded
 ** Description: creates a 2D vector of x rows and y columns, initialized
 ** to 3.
 ** Parameters: two integers for rows(x) and columns(y)
 *********************************************************************/
 Vector2D::Vector2D(int num_1, int num_2) :v(num_1, vector<int>(num_2, 3)) {
  x = num_1;
  y = num_2;

  //creates a 2d vector from user specifications and every element is initialized to 3
  // vector< vector<int> > v(x, vector<int>(y, 3)); 
}

/********************************************************************* 
 ** Constructor: default
 ** Description: creates a 10x10 2d vector, every element intiialized
 ** to 3.
 ** Parameters: none 
 *********************************************************************/
 Vector2D::Vector2D() :v(10, vector<int>(10, 3)) {
  x = 10;
  y = 10;
  //creates a (10x10) vector where every element is initialized to 3
  //vector< vector<int> > v(x, vector<int>(y, 3)); 
}

/********************************************************************* 
 ** Function: setVectorElement
 ** Description: allows the programmer to set an element in the vector
 ** Parameters: 2 integers for row and column, and value for the element
 ** to be set to. 
 *********************************************************************/
 void Vector2D::setVectorElement(int row, int col, int set) {
   x = row;
   y = col;
   v[x][y] = set;
 }

/********************************************************************* 
 ** Function: printVector
 ** Description: prints the vector to the console 
 ** Parameters: none
 *********************************************************************/
 void Vector2D::printVector() {
  for (auto i = 0; i < v.size(); i++) {
   for (auto j = 0; j < v[i].size(); j++) {
     cout << v[i][j] << " ";
   }
   cout << "\n";
 }  
}

/********************************************************************* 
 ** Function: getVectorElement
 ** Description: returns a vector element at a user specified location
 ** Parameters: the coordinates of the element the user wishes to return
 *********************************************************************/
 int Vector2D::getVectorElement(int coordinate_1, int coordinate_2) {
  x = coordinate_1;
  y = coordinate_2;
  return v[x][y];
}

/********************************************************************* 
 ** Operator Overload: *
 ** Parameters: const Vector2D& LHS, const Vector2D& RHS
 *********************************************************************/
 const Vector2D operator*(const Vector2D& LHS, const Vector2D& RHS) {

// int n1 = LHS[0].size();
// int n2 = RHS.size();

// vector<int> a1(n2, 0);
// vector<vector<int> > ans(n1, a1);

// int matchingSize = LHS.size();
// assert(v2[0].size() == matchingSize);

// for (int i = 0; i < n1; i++) {
//     for (int j = 0; j < n2; j++) {
//         for (int k = 0; k < matchingSize; k++) {
//             ans[i][j] += LHS[i][k] * RHS[k][j];
//         }
//     }
// }
// return ans;
// }
//   vector< vector<int> c >;
//   for (int i = 0; i < LHS.size(); ++i) {
//     for (int j = 0; j < RHS[0].size(); ++j) {
//       int sum = 0;
//       for (int k = 0; k < LHS[0].size(); ++k) {
//         sum = sum + LHS[i][k]*RHS[k][j];
//       }
//       c[i][j] = sum;
//     }
//   }
//   return c;
// }
//   int n = LHS.size();
//   int m = LHS[0].size();
//   int p = RHS[0].size();
//   Matrix c(n, vector<int>(p, 0));
//   for (int j = 0; j < p; ++j) {
//     for (int k = 0; k < m; ++k) {
//       for (int i = 0; i < n; ++i) {
//           c[i][j] += LHS[i][k]*RHS[k][j];
//       }
//     }
//   }
// return c;
}

 #endif