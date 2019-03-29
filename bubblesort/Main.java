import java.util.Arrays;

/**
 * Given an array of integers, sort the array in ascending order using the Bubble Sort 
 * algorithm. Once sorted, print sorted array.
 */

public class Main {

     public static void main(String[] args){
        
        final int n = (int) Math.floor(Math.random() * (20 - 10) + 10); 
        int[] nums = new int[n];

        for (int i = 0; i < nums.length; i++)
            nums[i] = (int) Math.floor(Math.random() * 255);
        
        System.out.println(Arrays.toString(nums));

        for (int i = 0; i < nums.length; i++) {
            for (int j = 0; j < nums.length - i - 1; j++) {
                if (nums[j] > nums[j + 1]) {
                    final int temp = nums[j + 1];
                    nums[j + 1] = nums[j];
                    nums[j] = temp;
                }
            }
        }
        
        System.out.println(Arrays.toString(nums));
        
     }
}