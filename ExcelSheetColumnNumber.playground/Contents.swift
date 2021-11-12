class Solution {
    func titleToNumber(_ columntitle: String) -> Int {
        guard !columntitle.isEmpty else { return 0 }
        
        var result = 0
        
        for (_, char) in columntitle.enumerated() {
            result *= 26
            result += Int(char.asciiValue! - 64)
        }
        
        return result
    }
}

Solution().titleToNumber("A")
Solution().titleToNumber("AA")
Solution().titleToNumber("AB")
Solution().titleToNumber("BB")
