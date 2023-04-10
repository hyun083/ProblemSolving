import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var map = Array(repeating: Array(repeating: false, count: n), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<m{
    let ab = readLine()!.split(separator: " ").map{Int($0)!-1}
    let a = ab[0]
    let b = ab[1]
    map[a][b] = true
    map[b][a] = true
}
var q = [Int]()
var dq = [Int]()
var ans = 0
func bfs(){
    var level = 0
    while !q.isEmpty{
        level += 1
        if level >= 3{
            break
        }
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for next in 0..<n{
                if !visited[next] && map[curr][next]{
                    ans += 1
                    visited[next] = true
                    q.append(next)
                }
            }
        }
    }
}
q.append(0)
visited[0] = true
bfs()
print(ans)