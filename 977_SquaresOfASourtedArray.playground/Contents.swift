import UIKit

/*
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
 Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  
 Constraints:
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.
  
 Follow up: Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?
 */

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        if nums.isEmpty { return [] }
        
        var start = 0
        var end = nums.count - 1
        var insertIndex = end
        
        var results = Array(repeating: 0, count: nums.count)
        
        while start <= end {
            let square1 = nums[start] * nums[start]
            let square2 = nums[end] * nums[end]
            
            if square1 < square2 {
                results[insertIndex] = square2
                end -= 1
            } else {
                results[insertIndex] = square1
                start += 1
            }
            insertIndex -= 1
        }
        return results
    }
}

class MySolution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        if nums.count == 1 { return [nums[0] * nums[0]]}
        var start = 0
        var end = nums.count - 1
        var results = [Int]()
        while start <= end {
            if abs(nums[start]) < abs(nums[end]) {
                results.insert(nums[end] * nums[end], at: 0)
                end -= 1
            } else {
                results.insert(nums[start] * nums[start], at: 0)
                start += 1
            }
        }
        
        return results
    }
}

Solution().sortedSquares([-8, -3, 0, 1, 3, 5, 9])
