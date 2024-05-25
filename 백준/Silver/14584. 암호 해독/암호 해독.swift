import Foundation

let S = readLine()!.map{String($0)}
let N = Int(readLine()!)!
var words = [String]()
var arr = [Int](97...122)

for _ in 0..<N{
    let word = readLine()!
    words.append(word)
}

for _ in 0..<26{
    arr.insert(arr.removeLast(), at: 0)
    var tmp = ""
    
    for alpha in S{
        let idx = Int(Character(alpha).asciiValue!)-97
        let newAlpha = String(UnicodeScalar(arr[idx])!)
        tmp.append(newAlpha)
    }
    
    for word in words{
        if tmp.contains(word){
            print(tmp)
            break
        }
    }
}