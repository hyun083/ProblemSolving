import Foundation

let nd = readLine()!.split(separator: " ").map{Int($0)!}
let n = nd[0]
let d = nd[1]

var arr = [(p:Int,v:Int)]()

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((info[0],info[1]))
}
arr.sort(by: {$0.p < $1.p})

var head = 0
var tail = 0
var sum = 0
var ans = 0

while tail < n{
    if arr[tail].p-arr[head].p >= d{
        sum -= arr[head].v
        head += 1
    }else if tail < n{
        sum += arr[tail].v
        tail += 1
        ans = max(ans, sum)
    }
}
print(ans)