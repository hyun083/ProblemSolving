import Foundation

let N = readLine()!.replacingOccurrences(of: "()", with: "*").map{String($0)}
var stk = 0
var ans = 0

for curr in N{
    if curr == "("{
        stk += 1
    }else if curr == "*"{
        ans += stk
    }else{
        stk -= 1
        ans += 1
    }
}
print(ans)