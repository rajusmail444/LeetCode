import UIKit

/*
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 Example 3:
 Input: nums = [1], target = 0
 Output: -1
  
 Constraints:
 1 <= nums.length <= 5000
 -104 <= nums[i] <= 104
 All values of nums are unique.
 nums is an ascending array that is possibly rotated.
 -104 <= target <= 104
*/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            let midVal = nums[mid]
            
            if midVal == target { return mid }
            
            if midVal >= nums[start] {
                if midVal > target && target >= nums[start] {
                    end = mid-1
                } else {
                    start = mid+1
                }
            } else {
                if midVal < target && target <= nums[end] {
                    start = mid+1
                } else {
                    end = mid-1
                }
            }
        }
        
        return -1
    }
}

class MySolution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        var pivot = nums.count-1
        while nums[0] > nums[pivot] {
            pivot -= 1
        }
        if pivot < nums.count-1 {
            pivot += 1
        }
        
        var result = -1
        if nums[pivot] <= target && target <= nums[nums.count-1] {
            result = binarySearch(nums, target, pivot, nums.count-1)
        } else {
            result = binarySearch(nums, target, 0, pivot - 1)
        }
        return result
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
        if start > end { return -1 }
        let mid = start + (end - start) / 2
        
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            return binarySearch(nums, target, start, mid-1)
        } else {
            return binarySearch(nums, target, mid+1, end)
        }
    }
}

Solution().search([4,5,6,7,0,1,2], 0) // 4
Solution().search([4,5,6,7,0,1,2], 3) // -1
Solution().search([1, 3], 0) // -1
Solution().search([1], 0) // -1
