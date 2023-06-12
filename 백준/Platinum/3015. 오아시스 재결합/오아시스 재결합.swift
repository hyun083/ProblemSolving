import Foundation

var stack = [(height:Int, cnt:Int)]()
let N = Int(readLine()!)!
var ans = 0

for _ in 0..<N{
    let currHeight = Int(readLine()!)!
    var cnt = 1
    
    while !stack.isEmpty && stack.last!.height <= currHeight{
        if stack.last!.height == currHeight{
            ans += stack.last!.cnt
            cnt += stack.last!.cnt
        }else{
            ans += stack.last!.cnt
        }
        stack.removeLast()
    }
    
    if !stack.isEmpty { ans += 1 }
    stack.append((currHeight,cnt))
}

print(ans)