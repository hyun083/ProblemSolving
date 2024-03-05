import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()
var sum = 0

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(line)
    sum += line.reduce(0, +)
}

var lo = 0
var hi = 10000000
var ans = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    
    for i in 0..<N{
        for k in 0..<N{
            cnt += map[i][k]>=mid ? mid:map[i][k]
        }
    }
    
    if cnt >= (sum+1)/2{
        ans = mid
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans)