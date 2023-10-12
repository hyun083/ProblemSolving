import Foundation

let N = Int(readLine()!)!

var num = readLine()!.split(separator: " ").map{Int($0)!}
var ans = Array(repeating: 0, count: N)
var tmp = [(idx:Int, height:Int)]()
var stk = [(idx:Int, height:Int)]()

for i in 0..<N{
    stk.append((i+1, num[i]))
}

while !stk.isEmpty{
    let curr = stk.removeLast()
    
    while !tmp.isEmpty && tmp.last!.height <= curr.height{
        let top = tmp.removeLast()
        ans[top.idx-1] = curr.idx
    }
    
    tmp.append(curr)
}
for ans in ans{
    print(ans, terminator: " ")
}