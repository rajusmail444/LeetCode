import UIKit

/*
 Given an integer x, return true if x is palindrome integer.
 An integer is a palindrome when it reads the same backward as forward.
 For example, 121 is a palindrome while 123 is not.
  
 Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
  
 Constraints:
 -231 <= x <= 231 - 1

 Follow up: Could you solve it without converting the integer to a string?
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x < 10 { return true }
        
        var temp = x
        var results = 0
        while temp > 0 {
            results = (results * 10) + (temp % 10)
            temp = temp / 10
        }
        
        return x == results
    }
}


class MySolution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x < 10 { return true }
        var x = x
        var arrayX = [Int]()
        
        while x > 0 {
            let val = x%10
            print("val: \(val)")
            arrayX.append(val)
            x = x/10
            print("x: \(x)")
        }
        print(arrayX)
        
        var first = 0
        var last = arrayX.count - 1
        while first < last {
            if arrayX[first] != arrayX[last] {
                return false
            }
            first += 1
            last -= 1
        }
        return true
    }
}

Solution().isPalindrome(12344321)
Solution().isPalindrome(12344320)
