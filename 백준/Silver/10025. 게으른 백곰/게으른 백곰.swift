import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]
var ans = 0
var myMax = 0

var head = 0
var tail = 2*k
var sum = 0

var map = Array(repeating: 0, count: 1000001)

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let g = info[0]
    let x = info[1]
    map[x] = g
    if x <= 2*k{ sum += map[x] }
    myMax += g
}

ans = sum
while tail < 1000000{
    tail += 1
    sum += map[tail]
    sum -= map[head]
    head += 1
    ans = max(ans, sum)
}
if k >= 500000{
    print(myMax)
}else{
    print(ans)
}