import UIKit

/*
    You're given strings J representing the types of stones that are jewels, and S representing the stones you have. Each character in S is a type of stone you have. You want to know how many of the stones you have are jewels.
 
    The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
    Input: J = "aA", S = "aAAbbbb"
    Output: 3
 
    Input: J = "z", S = "ZZ"
    Output: 0
*/

final class StringChallenge {
    static func jewels(_ j: String, in s: String) -> Int {
        if j.count == 0 || s.count == 0 { return 0 }
        
        let j = Array(j)
        var numberOfJewels = 0
        
        for stone in s {
            if j.contains(stone) {
                numberOfJewels += 1
            }
        }
        
        return numberOfJewels
    }
}

StringChallenge.jewels("aA", in: "aAAbbbb")
StringChallenge.jewels("z", in: "ZZ")
