import Foundation

var map = Array(repeating: 0, count: 101)
var visited = Array(repeating: false, count: 101)

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]] = line[1]
}
for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]] = line[1]
}

var queue = [(Int,Int)]()
queue.append((1,0))

while !queue.isEmpty{
    let top = queue.removeFirst()
    let curr = top.0
    let cnt = top.1
    visited[curr] = true
    
    if curr == 100{
        print(cnt)
        break
    }
    for i in 1...6{
        var next = curr + i
        if next > 100{
            continue
        }
        next = map[next] != 0 ? map[next] : next
        if !visited[next]{
            visited[next] = true
            queue.append((next,cnt+1))
        }
    }
}