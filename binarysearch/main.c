#include <stdio.h>

/**
 * Make a program that implements binary search.
 *
 **/
int main(int argc, char* argv[]) {

   // end program if not enough arguments.
   if (argc < 2) {
      printf("Enter value to find as argument.\n");
      return 1;
   }

   const int find = atoi(argv[1]);

   // stores all the numbers to search though
   int nums[20] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 };

   const int arrLength = sizeof(nums) / sizeof(nums[0]);

   int start = 0;
   int end   = arrLength - 1;

   int iterations = 0;

   while (start <= end) {
      iterations += 1;

      const int mid = (start + end) / 2;

      if (nums[mid] > find) {
         end = mid - 1;
      } else if (nums[mid] < find) {
         start = mid + 1;
      } else {
         printf("Found at index %d\n", mid);
         printf("Found in %d iterations\n", iterations);

         // end program if number found.
         return 0;
      }

   }

   // display error if number not found.
   printf("Number not found.\n");

   return 0;
}