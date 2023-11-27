import Foundation

let N = readLine()!.replacingOccurrences(of: "()", with: "*").map{String($0)}
var stk = [String]()
var ans = 0

for i in 0..<N.count{
    let curr = N[i]
    if curr == "("{
        stk.append(curr)
    }else if curr == "*"{
        ans += stk.count
    }else{
        stk.removeLast()
        ans += 1
    }
}
print(ans)