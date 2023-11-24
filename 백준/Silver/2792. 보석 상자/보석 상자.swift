import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var gems = [Int]()
var left = 1
var right = 1

for _ in 0..<M{
    gems.append(Int(readLine()!)!)
    right = max(right, gems.last!)
}

while left <= right{
    let mid = (left+right)/2
    var cnt = 0
    
    for gem in gems{
        cnt += gem/mid
        cnt += gem%mid>0 ? 1:0
    }
    if cnt > N{
        left = mid+1
    }else{
        right = mid-1
    }
}

print(left)