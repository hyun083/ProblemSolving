import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1])}[0]
var visited = Array(repeating: false, count: N)
var map = [Int]()
var ans = -1

for _ in 0..<N{
    map.append(Int(readLine()!)!)
}

func bfs(from curr:Int, cnt:Int){
    let next = map[curr]
    if next == K{
        ans = cnt+1
        return
    }else if visited[next] { return }
    
    visited[next] = true
    bfs(from: next, cnt: cnt+1)
}

visited[0] = true
bfs(from: 0, cnt: 0)
print(ans)