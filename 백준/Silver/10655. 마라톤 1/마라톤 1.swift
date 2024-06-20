import Foundation

let N = Int(readLine()!)!
var arr = [(x:Int, y:Int)]()
var total = 0

for _ in 0..<N{
    let (x,y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((x,y))
}

for i in 0..<N-1{
    let curr = arr[i]
    let next = arr[i+1]
    let cost = abs(curr.x-next.x)+abs(curr.y-next.y)
    total += cost
}

var ans = total
for i in 1..<N-1{
    let pre = arr[i-1]
    let next = arr[i+1]
    let seg = abs(pre.x-arr[i].x) + abs(pre.y-arr[i].y) + abs(next.x-arr[i].x) + abs(next.y-arr[i].y)
    let newLine = abs(pre.x-next.x) + abs(pre.y-next.y)
    ans = min(ans, total-seg+newLine)
}
print(ans)