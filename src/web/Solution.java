package web;



public class Solution {
	 public static int[] twoSum(int[] nums, int target) {
	        if(nums == null || nums.length == 0) return null;
	        if(target < 0) return null;
	        int start = 0;
	        int end = nums.length - 1;
	        while(start < end){
	            if(nums[start] + nums[end] == target){
	                break;
	            }
	            else if(nums[start] + nums[end] < target){
	                start++;
	            }else if(nums[start] + nums[end] > target){
	                end--;
	            }
	        }
	        int[] res = new int[2];
	        res[0] = start;
	        res[1] = end;
	        return res;
	    }
    
	 public static void main(String[ ] arg){
		 int[] num=new int[]{3, 2, 4};
		 int target = 6;
		 twoSum(num, target);
		 
	 } 
}
