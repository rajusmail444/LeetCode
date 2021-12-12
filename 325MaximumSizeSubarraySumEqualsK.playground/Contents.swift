import UIKit

/*
 Given an array nums and a target value K, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.
 Note: The sum of the entire nums array is guaranteed to fit within the 32-bit sized integer range.
 
 Example:
 Input nums = [1, -1, 5, -2, 3], K = 3
 Output: 4
 Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.
 */

func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
    
    var m :[Int:Int] = [:]
    var res = Int.min
    var sum = 0;
    
    for i in 0..<nums.count{
        
        sum += nums[i];
        print("sum: \(sum)")
        if(sum == k){
            res = i+1;
        }else if( m[sum-k] != nil){
            print("m[sum-k]: \(m[sum-k])")
            res = max(res, i - m[sum-k]!)
        }
        
        if(m[sum] == nil){
            m[sum] = i;
            print("sums: \(m)")
        }
        
    }
    
    
    return res;
}

let nums = [-2, -1, 2, 1]

maxSubArrayLen(nums, 1)

//let nums = [1, -1, 5, -2, 3]
//let sums = [1, 0, 5, 3, 6]
//let sumsk = [-2, -3, 2, 0, 3]


