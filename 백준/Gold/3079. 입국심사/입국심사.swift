import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var screen = [Int]()
for _ in 0..<N{
    screen.append(Int(readLine()!)!)
}

var left = 1
var right = screen.min()! * M
var ans = 0

while left <= right{
    let mid = (left+right)/2
    var cnt = 0
    
    for i in 0..<N{
        cnt += mid/screen[i]
        if cnt >= M { break }
    }
    
    if cnt >= M {
        if ans>mid || ans==0{
            ans = mid
        }
        right = mid-1
    }else{
        left = mid+1
    }
}
print(ans)