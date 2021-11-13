class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty { return true}
        
        let arrayS = Array(s.lowercased())
        
        var start = 0
        var end = arrayS.count - 1
        while start < end {
            while start < end && !arrayS[start].isAlphanumeric {
                start += 1
            }
            
            while start < end && !arrayS[end].isAlphanumeric {
                end -= 1
            }
            
            guard arrayS[start] == arrayS[end] else {
                return false
            }
            start += 1
            end -= 1
         }
        return true
    }
}

extension Character {
    var isAlphanumeric: Bool {
        isWholeNumber || isLetter
    }
}

Solution().isPalindrome("A man, a plan, a canal: Panama")


Solution().isPalindrome("race a car")

Solution().isPalindrome(" ")

Solution().isPalindrome("A")

