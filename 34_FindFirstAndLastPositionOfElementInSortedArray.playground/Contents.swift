import UIKit

/*
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
 If target is not found in the array, return [-1, -1].
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 Example 3:
 Input: nums = [], target = 0
 Output: [-1,-1]
  
 Constraints:
 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums is a non-decreasing array.
 -109 <= target <= 109
*/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [-1, -1] }
        var results = Array(repeating: -1, count: 2)
        binarySearch(nums, target, 0, nums.count-1, &results)
        return results
    }
    
    func binarySearch(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int, _ results: inout [Int]) {
        if start > end {
            results = [-1, -1]
            return
        }
        
        let mid = start + (end - start) / 2
        if target == nums[mid] {
            getPosition(nums, target, mid, &results)
        } else if target < nums[mid] {
            binarySearch(nums, target, start, mid-1, &results)
        } else {
            binarySearch(nums, target, mid+1, end, &results)
        }
    }
    
    func getPosition(_ nums: [Int], _ target: Int, _ position: Int, _ results: inout [Int]) {
        
        var start = position
        var end = position
        while start >= 0 && nums[start] == target {
                start -= 1
        }
        while end <= nums.count-1 && nums[end] == target {
                end += 1
        }
        results = [start+1, end-1]
    }
}

Solution().searchRange([5,7,7,8,8,10], 8)
Solution().searchRange([5,7,7,8,8,10], 6)
Solution().searchRange([], 6)
