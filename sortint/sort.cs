using System;
using System.Collections.Generic;
using System.Linq;

/**
 * Create a program that takes in an integer and sorts the number in that integer. It should
 * return another integer, NOT an array.
 */
public class sort  {

   static int sortAssending(int unsorted) {

      List<int> digits = new List<int>();

      while (unsorted != 0) {
         digits.Add(unsorted % 10);
         unsorted /= 10;
      }

      int[] nums = digits.ToArray();

      int changes;

      do {

         changes = 0;
         for (int i = 1; i < nums.Length; i++) {
            if (nums[i - 1] > nums[i]) {
               int temp = nums[i - 1];
               nums[i - 1] = nums[i];
               nums[i] = temp;
               changes += 1;
            }
         }

      } while (changes > 0);

      return nums
            .Select((t, i) => t * Convert.ToInt32(Math.Pow(10, nums.Length - i - 1)))
            .Sum();
   }

   static void Main() {
      
      Console.WriteLine(sortAssending(87724157));

   }

}
