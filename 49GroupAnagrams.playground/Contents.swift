class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard !strs.isEmpty else { return [] }
        
        var holder = [String: [String]]()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            
            if holder[sortedStr] == nil {
                holder[sortedStr] = [str]
            } else {
                var previousCombo = holder[sortedStr]
                previousCombo?.append(str)
                holder[sortedStr] = previousCombo
            }
        }
        return Array(holder.values)
    }
}

let strs = ["eat","tea","tan","ate","nat","bat"]
Solution().groupAnagrams(strs)
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

let emptyStr = [""]
Solution().groupAnagrams(emptyStr)
// Output: [[""]]

let singleStr = ["a"]
Solution().groupAnagrams(singleStr)
// Output: [["a"]]
