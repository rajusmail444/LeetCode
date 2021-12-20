import UIKit
/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.
 
 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
  
 Constraints:
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
*/

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty { return true }
        
        let arrayS = Array(s.lowercased())
        var start = 0
        var end = arrayS.count - 1
        
        while start < end {
            while start < end && !arrayS[start].isAlphaNumeric {
                start += 1
            }
            while start < end && !arrayS[end].isAlphaNumeric {
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
    var isAlphaNumeric: Bool {
        return isWholeNumber || isLetter
    }
}

Solution().isPalindrome("A man, a plan, a canal: Panama") // true
Solution().isPalindrome("race a car") // false
Solution().isPalindrome(" ") // true
