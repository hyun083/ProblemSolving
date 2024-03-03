import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var score = readLine()!.split(separator: " ").map{Int($0)!}

var lo = 0
var hi = score.reduce(0, +)
var ans = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    var sum = 0
    var res = Int.max
    
    for i in 0..<N{
        sum += score[i]
        if sum >= mid{
            res = min(res, sum)
            cnt += 1
            sum = 0
        }
    }

    if cnt >= M{
        ans = max(ans, res)
        lo = mid+1
    }else{
        hi = mid-1
    }
}
print(ans)