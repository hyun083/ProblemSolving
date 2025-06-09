import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)
var ans = 0

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    map[V].append(U)
}

func bfs(from root:Int){
    var idx = 0
    var q = [root]
    
    while idx<q.count{
        let curr = q[idx]
        
        for next in map[curr]{
            if !visited[next]{
                visited[next] = true
                ans += 1
                q.append(next)
            }
        }
        idx += 1
    }
}

let target = Int(readLine()!)!-1
bfs(from: target)
print(ans)