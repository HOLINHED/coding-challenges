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

      for (int i = 0; i < nums.Length; i++) {
         for (int j = 0; j < nums.Length - i - 1; j++) {
            if (nums[j] > nums[j + 1]) {
               int temp = nums[j + 1];
               nums[j + 1] = nums[j];
               nums[j] = temp;
            }
         }
      }

      return nums
            .Select((t, i) => t * Convert.ToInt32(Math.Pow(10, nums.Length - i - 1)))
            .Sum();
   }

   static void Main() {
      
      Console.WriteLine(sortAssending(87724157));

   }

}
