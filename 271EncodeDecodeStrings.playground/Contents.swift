class Codec {
    private let symbol = "?"
    func encode(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var results = ""
        
        for str in strs {
            let length = str.count
            results += "\(length)\(symbol)\(str)"
        }
        
        return results
    }
    
    func decode(_ s: String) -> [String] {
        if s.isEmpty { return [] }
        var results = [String]()
        let sArray = Array(s)
        var i = 0
        var j = 0
        
        while i < sArray.count {
            j = i
            
            while String(sArray[j]) != symbol {
                j += 1
            }
            
            let lengthOfWord = Int(String(sArray[i..<j]))!
            let actualWord = String(sArray[j+1 ..< j + 1 + lengthOfWord])
            results.append(actualWord)
            i = j+1+lengthOfWord
        }
        
        return results
    }
}

let encodedString = Codec().encode(["Hello", "World"])
let decodedString = Codec().decode(encodedString)

let encodedName = Codec().encode(["John", "Snow"])
let decodedName = Codec().decode(encodedName)

let encodedLongName = Codec().encode(["John", "Snow", "Game", "of", "Thrones"])
let decodedLongName = Codec().decode(encodedLongName)
