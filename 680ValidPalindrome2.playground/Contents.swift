class Solution {
    func validPalindrome(_ s: String) -> Bool {
        if s.isEmpty { return false }
        
        let sArray = Array(s.lowercased())
        var start = 0
        var end = sArray.count - 1
        while start <= end {
            if sArray[start] != sArray[end] {
                return check(sArray, start+1, end) || check(sArray, start, end-1)
            }
            start += 1
            end -= 1
        }
        return true
    }
    
    private func check(_ char: [Character], _ start: Int, _ end: Int) -> Bool {
        var start = start
        var end = end
        while start < end {
            if char[start] != char[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

var s = "aba"
Solution().validPalindrome(s)
// Output: true

s = "abca"
Solution().validPalindrome(s)
// Output: true

s = "abcda"
Solution().validPalindrome(s)
// Output: false

