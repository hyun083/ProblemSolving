import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var stk = [Int]()
var ans = 0
for _ in 0..<N {
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let pos = info[0]
    let speed = info[1]
    arr.append(speed)
}

for speed in arr.reversed() {
    if stk.isEmpty{
        stk.append(speed)
    } else {
        if stk.last! < speed {
            continue
        } else {
            stk.append(speed)
        }
    }
}
print(stk.count)