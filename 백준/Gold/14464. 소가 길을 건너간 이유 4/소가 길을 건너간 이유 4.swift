import Foundation

let cn = readLine()!.split(separator: " ").map{Int($0)!}
let c = cn[0]
let n = cn[1]

var chicken = [Int]()
var cow = [(Int,Int)]()
var lastTime = 0

for _ in 0..<c{
    chicken.append(Int(readLine()!)!)
    lastTime = max(lastTime, chicken.last!)
}

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    if lastTime < info[0] { continue }
    cow.append((info[0],info[1]))
}

chicken.sort(by: <)
cow.sort(by: {
    if $0.1 == $1.1{
        return $0.0 < $1.0
    }else{
        return $0.1 < $1.1
    }
})

var cnt = 0
var visited = Array(repeating: false, count: cow.count)

for t in 0..<c{
    let time = chicken[t]
    for k in 0..<cow.count{
        if !visited[k]{
            let s = cow[k].0
            let e = cow[k].1
            if s<=time && time<=e{
                cnt += 1
                visited[k] = true
                break
            }
        }
    }
}

print(cnt)