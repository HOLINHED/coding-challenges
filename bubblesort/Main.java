import java.util.Arrays;

/**
 * Given an array of integers, sort the array in ascending order using the Bubble Sort 
 * algorithm. Once sorted, print sorted array.
 */

public class Main {

     public static void main(String[] args){
        
        final int n = (int) Math.floor(Math.random() * 20); 
        int[] nums = new int[n];

        for (int i = 0; i < nums.length; i++)
            nums[i] = (int) Math.floor(Math.random() * 255);
        
        System.out.println(Arrays.toString(nums));
        
        int c;
        
        do {
            c = 0;
            
            for (int i = 1; i < nums.length; i++) {
                if (nums[i - 1] > nums[i]) {
                    final int temp  = nums[i - 1];
                    nums[i - 1] = nums[i];
                    nums[i] = temp;
                    c += 1;
                }
            }

        } while (c > 0);
        
        System.out.println(Arrays.toString(nums));
        
     }
}