import Foundation

let N = Int(readLine()!)!
let line = readLine()!.map{String($0)}
var dic = Dictionary<String,Int>()

for char in line{
    if let cnt = dic[char]{
        dic[char] = cnt + 1
    }else{
        dic[char] = 1
    }
}

var ans = dic["u"] ?? 0
ans = min(ans, dic["o"] ?? 0)
ans = min(ans, dic["s"] ?? 0)
ans = min(ans, dic["p"] ?? 0)
ans = min(ans, dic["c"] ?? 0)
print(ans)