import Foundation

let N = Int(readLine()!)!
var stk = readLine()!.split(separator: " ").map{Int($0)!}
var tmp = [Int]()
var ans = Array(repeating: "-1", count: N)
var idx = N-1

while !stk.isEmpty{
    let curr = stk.removeLast()
    while !tmp.isEmpty && tmp.last! <= curr{
        tmp.removeLast()
    }
    
    if !tmp.isEmpty{
        let top = tmp.last!
        ans[idx] = String(top)
    }
    
    tmp.append(curr)
    idx -= 1
}
print(ans.joined(separator: " "))