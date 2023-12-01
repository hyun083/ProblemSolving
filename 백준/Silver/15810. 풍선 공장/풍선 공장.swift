import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var info = readLine()!.split(separator: " ").map{Int($0)!}
var left = 0
var right = info.max()!*2*M
var ans = 0

while left <= right{
    let mid = (left+right)/2
    var cnt = 0
    
    for ball in info{
        cnt += mid/ball
    }
    if cnt >= M{
        ans = mid
        right = mid-1
    }else{
        left = mid+1
    }
}
print(ans)