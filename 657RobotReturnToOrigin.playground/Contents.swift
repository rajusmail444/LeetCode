class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var horizontal: Int = 0
        var vertical: Int = 0
        for move in moves.unicodeScalars {
            switch move {
            case "R":
                horizontal += 1
            case "U":
                vertical += 1
            case "L":
                horizontal -= 1
            case "D":
                vertical -= 1
            default:
                break
            }
        }
        return horizontal == 0 && vertical == 0
    }
}

var moves = "LDRRLRUULR"
Solution().judgeCircle(moves)
// Output: false

moves = "UD"
Solution().judgeCircle(moves)
// Output: true

moves = "RRDD"
Solution().judgeCircle(moves)
// Output: false

