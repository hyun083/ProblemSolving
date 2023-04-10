import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let n = line[0]
let m = line[1]
let k = line[2]
let x = line[3]-1

var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let u = line[0]-1
    let v = line[1]-1
    map[u].append(v)
}
var ans = Array(repeating: 0, count: n)
var q = [Int]()
var dq = [Int]()
var cost = 0
func bfs(){
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        cost += 1
        for _ in 0..<dq.count{
            let u = dq.removeLast()
            for v in map[u]{
                if !visited[v]{
                    visited[v] = true
                    q.append(v)
                    ans[v] = cost
                }
            }
            
        }
    }
}
q.append(x)
visited[x] = true
bfs()
var result = [String]()
for i in 0..<n{
    if ans[i] == k{
        result.append("\(i+1)")
    }
}
if result.isEmpty{
    print(-1)
}else{
    print(result.joined(separator: "\n"))
}