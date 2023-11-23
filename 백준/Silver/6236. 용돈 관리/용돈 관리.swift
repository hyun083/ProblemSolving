import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var budget = [Int]()

for _ in 0..<N{
    budget.append(Int(readLine()!)!)
}

var left = 1
var right = budget.reduce(0, +)

while left<=right{
    let mid = (left+right)/2
    var cnt = 1
    var curr = mid
    
    for i in 0..<N{
        if mid < budget[i] {
            cnt = M+1
            break
        }
        if curr < budget[i]{
            cnt += 1
            curr = mid
        }
        curr -= budget[i]
    }
    if cnt<=M{
        right = mid-1
    }else{
        left = mid+1
    }
}
print(left)