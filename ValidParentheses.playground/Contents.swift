class Solution {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty { return false }
        
        var stack = [String]()
        for char in s {
            let char = String(char)
            switch char {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                if let lastChar = stack.last, lastChar == char {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

Solution().isValid("()")
Solution().isValid("()[]{}")
Solution().isValid("(]")
Solution().isValid("([)]")
Solution().isValid("{[]}")
