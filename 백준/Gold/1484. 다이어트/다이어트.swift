import Foundation

var arr = Array(repeating: 0, count: 100001)
for i in 0..<100001{ arr[i] = i*i }

let g = Int(readLine()!)!
var head = 1
var tail = 2
var ans = [Int]()

while tail < 100001{
    let gap = arr[tail] - arr[head]
    if gap > g{
        head += 1
    }else{
        tail += 1
    }
    if gap == g{
        ans.append(tail-1)
    }
}

if ans.isEmpty{
    print(-1)
}else{
    for ans in ans{ print(ans) }
}
