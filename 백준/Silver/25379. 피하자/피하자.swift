import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!%2}

var cnt = 0
var tmp = 0

for num in arr{
    if num==0{
        tmp += cnt
    }else{
        cnt += 1
    }
}

var ans = tmp
cnt = 0
tmp = 0
for num in arr{
    if num==1{
        tmp += cnt
    }else{
        cnt += 1
    }
}
ans = min(ans, tmp)
print(ans)