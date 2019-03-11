import java.util.Arrays;

/**
 * Given an array of integers, sort the array in ascending order using the Bubble Sort 
 * algorithm. Once sorted, print sorted array.
 */

public class Main {

     public static void main(String[] args){
        
        int[] nums = new int[24];

        for (int i = 0; i < nums.length; i++)
            nums[i] = (int) Math.floor(Math.random() * 255);
        
        System.out.println(Arrays.toString(nums));
        
        int c = 10;
        
        while (c > 0) {
            c = 0;
            
            for (int i = 1; i < nums.length; i++) {
                if (nums[i - 1] > nums[i]) {
                    final int temp  = nums[i - 1];
                    nums[i - 1] = nums[i];
                    nums[i] = temp;
                    c += 1;
                }
            }
        }
        
        System.out.println(Arrays.toString(nums));
        
     }
}