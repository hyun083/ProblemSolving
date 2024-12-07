import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var res = ""
    for _ in 0..<N/5{
        res += "++++ "
    }
    for _ in 0..<N%5{
        res += "|"
    }
    print(res)
}