import UIKit

/*
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Note that you must do this in-place without making a copy of the array.

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]
  
 Constraints:
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
*/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 { return }
        for i in 0..<nums.count {
            if nums[i] == 0 {
                var j = i
                var shouldContinue = true
                while j < nums.count && shouldContinue {
                    if nums[j] != 0 {
                        nums.swapAt(i, j)
                        shouldContinue = false
                    }
                    
                    j += 1
                }
            }
        }
    }
}

var nums = [0,1,0,3,12]
Solution().moveZeroes(&nums)

nums = [0]
Solution().moveZeroes(&nums)


