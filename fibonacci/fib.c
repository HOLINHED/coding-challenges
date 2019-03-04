#include <stdio.h>

/**
 * Enter a number and have the program generate the Fibonacci
 * sequence to that number or to the Nth number.
 */

int main() {

   int lim;

   printf("Enter a number: ");
   scanf("%d", &lim);

   unsigned long long a = 0;
   unsigned long long b = 1;
   unsigned long long n = 0;

   for (int i = 0; i < lim; i++) {

      n = a + b;

      if (n < b) break;
      
      a = b;
      b = n;

      printf("%llu\n", n);

   }

   return 0;
}