import Foundation

let (N,L,W,H) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], Double($0[1]), Double($0[2]), Double($0[3]))}[0]

var left:Double = 0
var right:Double = 2000000000
var ans:Double = 0

for _ in 0..<1000{
    let mid:Double = (left+right)/2
    let cnt = Int(L/mid) * Int(W/mid) * Int(H/mid)
    
    if cnt >= N{
        ans = left
        left = mid
    }else{
        right = mid
    }
}
print(ans)