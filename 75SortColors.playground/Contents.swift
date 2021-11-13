class Solution {
    func sortColors(_ nums: inout [Int]) {
        if nums.isEmpty { return }
        
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            if start > 0 && nums[start] == 0 {
                nums.remove(at: start)
                nums.insert(0, at: 0)
                start += 1
            } else if start < end && nums[start] == 2 {
                nums.remove(at: start)
                nums.append(2)
                end -= 1
            } else {
                start += 1
            }
        }
    }
}

var nums = [2,0,2,1,1,0]
Solution().sortColors(&nums)
// Output: [0,0,1,1,2,2]

nums = [2,0,1]
Solution().sortColors(&nums)
// Output: [0,1,2]

nums = [0]
Solution().sortColors(&nums)
// Output: [0]

nums = [1]
Solution().sortColors(&nums)
// Output: [1]
