import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var level = Array(repeating: 0, count: n)
for _ in 0..<m{
    let ik = readLine()!.split(separator: " ").map{Int($0)!}
    let i = ik[0]-1
    let k = ik[1]-1
    map[i].append(k)
    map[k].append(i)
}

var q = [0]
visited[0] = true
var length = 1
func bfs(){
    while !q.isEmpty{
        for _ in 0..<q.count{
            let curr = q.removeFirst()
            for next in map[curr]{
                if !visited[next]{
                    visited[next] = true
                    q.append(next)
                    level[next] = length
                }
            }
        }
        length += 1
    }
}
bfs()

length = level.max()!
var cnt = 0
var hide = Int()
var flag = true
for i in 0..<level.count{
    if level[i] == length{
        if flag {
            flag = false
            hide = i+1
        }
        cnt += 1
    }
}
print(hide,length,cnt)