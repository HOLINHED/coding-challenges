#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>

/**
 * Takes in a credit card number from a common credit card vendor 
 * (Visa, MasterCard, American Express, Discoverer) and validates 
 * it to make sure that it is a valid number.
 */

bool isValid(long number) {

   int index = 0;
   int sum = 0;
   while (number > 0) {
      
      const int value = number % 10;

      if (index % 2 == 1) {
         sum += ((value * 2) % 10) + ((value * 2) / 10);
      } else {
         sum += value;
      }

      number /= 10;
      index += 1;
   }

   return sum % 10 == 0;
}

int main() {

   fputs(isValid(4724920792328946) ? "VALID\n" : "INVALID \n", stdout); // valid
   fputs(isValid(5100515623933822) ? "VALID\n" : "INVALID \n", stdout); // valid
   fputs(isValid(5200515623933822) ? "VALID\n" : "INVALID \n", stdout); // invalid

   return 0;
}