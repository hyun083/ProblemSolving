import Foundation

var stack = [(height:Int, cnt:Int)]()
let N = Int(readLine()!)!
var ans = 0

for _ in 0..<N{
    let currHeight = Int(readLine()!)!
    var cnt = 1
    
    while !stack.isEmpty && stack.last!.height <= currHeight{
        let top = stack.last!
        
        cnt += top.height==currHeight ? top.cnt : 0
        ans += top.cnt
        stack.removeLast()
    }
    
    if !stack.isEmpty { ans += 1 }
    stack.append((currHeight,cnt))
}

print(ans)