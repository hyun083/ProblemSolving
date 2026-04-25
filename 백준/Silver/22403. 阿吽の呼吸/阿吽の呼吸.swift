import Foundation

let N = Int(readLine()!)!
var stk = [String]()

for _ in 0..<N {
    let S = readLine()!
    if stk.isEmpty {
        stk.append(S)
    } else if S=="A" {
        stk.append(S)
    } else if stk.last!=="A" {
        stk.removeLast()
    } else {
        stk.append(S)
    }
}
print(stk.isEmpty ? "YES":"NO")