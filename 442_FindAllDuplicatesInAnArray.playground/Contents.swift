import UIKit

/*
 Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.

 You must write an algorithm that runs in O(n) time and uses only constant extra space.

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [2,3]
 
 Example 2:
 Input: nums = [1,1,2]
 Output: [1]
 
 Example 3:
 Input: nums = [1]
 Output: []
  
 Constraints:
 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n
 Each element in nums appears once or twice.
*/

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        if nums.isEmpty { return [] }
        
        var nums = nums
        var results = [Int]()
        
        for i in 0..<nums.count {
            let absNum = abs(nums[i])
            
            if nums[absNum-1] < 0 {
                results.append(absNum)
            }
            
            nums[absNum-1] *= -1
        }
        return results
    }
}


// This solution takes extra space, so not appropriate
class MySolution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        if nums.isEmpty { return [] }
        
        var cache = [Int: Int]()
        var results = [Int]()
        
        for val in nums {
            if let value = cache[val], value > 0 {
                if value == 1 {
                    results.append(val)
                }
                cache[val] = value+1
            } else {
                cache[val] = 1
            }
        }
        return results
    }
}

Solution().findDuplicates([4,3,2,7,8,2,3,1]) // [2,3]
Solution().findDuplicates([1,1,2]) // [1]
Solution().findDuplicates([1]) // []
