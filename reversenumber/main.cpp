#include <iostream>
#include "math.h"

int reverseNum(int n, int d) {

   if (d < 2) return n;

   const int b = pow(10,d - 1);
   const int x = (n % 10) * b;
   const int r = n / 10;

   return x + reverseNum(r, d - 1);
}

int main() {

   std::cout << "1234 reversed is " << reverseNum(1234, 4) << std::endl;

   return 0;
}