import Foundation

let N = Int(readLine()!)!
for _ in 0..<N {
    let info = readLine()!.split(separator: " ").map{String($0)}
    let K = Int(info[0])!
    var arr = info[1].map{String($0)}
    var stk = [String]()
    
    for _ in 0..<K {
        let curr = arr.removeLast()
        if curr == "<" {
            stk.append(curr)
        } else {
            if stk.last == "<" {
                stk.removeLast()
            } else {
                stk.append(curr)
            }
        }
    }
    
    print(stk.isEmpty ? "legal":"illegal")
}