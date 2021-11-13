class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var index = 1
        for i in 1..<nums.count {
            if nums[i-1] != nums[i] {
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}

var nums = [0,0,1,1,1,2,2,3,3,4]
Solution().removeDuplicates(&nums)
// Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
