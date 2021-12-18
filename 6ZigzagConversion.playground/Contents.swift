import UIKit

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  
 Example 1:
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 
 Example 2:
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 
 Example 3:
 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:
 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 Accepted
 678,998

 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows > s.count { return s }
        
        var rows = Array(repeating: [String](), count: numRows)
        var counter = 0
        var canGoDown = false
        
        let arrayS = Array(s)
        
        for char in arrayS {
            rows[counter].append(String(char))
            
            if counter == 0 || counter == numRows-1 {
                canGoDown = !canGoDown
            }
            
            canGoDown ? (counter += 1) : (counter -= 1)
        }
        let result = rows.flatMap { $0 }
        return result.joined(separator: "")
    }
}

print("PAHNAPLSIIGYIR -> \(Solution().convert("PAYPALISHIRING", 3))")
print("PINALSIGYAHRPI -> \(Solution().convert("PAYPALISHIRING", 4))")
print("PAYPALISHIRING -> \(Solution().convert("PAYPALISHIRING", 1))")
print("PAYPA -> \(Solution().convert("PAYPA", 5))")
print("A -> \(Solution().convert("A", 1))")
