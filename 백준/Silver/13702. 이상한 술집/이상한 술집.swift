import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var left = 1
var right = 0
var arr = [Int]()
var ans = 0

for _ in 0..<N{
    arr.append((Int(readLine()!)!))
    right = max(right, arr.last!)
}

while left<=right{
    let mid = (left+right)/2
    var cnt = 0
    
    for mak in arr{
        cnt += mak/mid
    }
    
    if cnt>=K{
        left = mid+1
        ans = mid
    }else{
        right = mid-1
    }
}
print(ans)