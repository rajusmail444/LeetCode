import UIKit
/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 Input: nums = [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
 
 Example 2:
 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 
 Example 3:
 Input: nums = [1,2,3]
 Output: 3
 
 Constraints:
 1 <= nums.length <= 100
 0 <= nums[i] <= 1000
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count <= 2 { return nums.max()! }
        
        let housesA = Array(nums[0...nums.count-2])
        let housesB = Array(nums[1...nums.count-1])
        
        return max(robStright(housesA), robStright(housesB))
    }
    
    func robStright(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return nums.max()!}
        var maxArray = Array(repeating: 0, count: nums.count)
        maxArray[0] = nums[0]
        maxArray[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            maxArray[i] = max(nums[i]+maxArray[i-2], maxArray[i-1])
        }
        return maxArray.last!
    }
}

Solution().rob([2,3,2]) //3

Solution().rob([1,2,3,1]) //4

Solution().rob([1,2,3]) //3
