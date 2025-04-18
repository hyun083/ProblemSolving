import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let NMK = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NMK[0]
    let M = NMK[1]
    let K = NMK[2]
    var map = Array(repeating: [Int](), count: N)
    var visited = Array(repeating: false, count: N)
    
    for _ in 0..<M{
        let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
        let U = UV[0]
        let V = UV[1]
        map[U].append(V)
        map[V].append(U)
    }
    let arr = readLine()!.split(separator: " ").map{Int($0)!-1}
    
    func bfs(from curr:Int){
        visited[curr] = true
        var q = [curr]
        var idx = 0
        
        while idx < q.count{
            let curr = q[idx]
            for next in map[curr]{
                if !visited[next]{
                    visited[next] = true
                }
            }
            idx += 1
        }
    }
    for node in arr{
        visited[node] = true
        bfs(from: node)
    }
    var ans = 0
    for node in 0..<N{
        ans += visited[node] ? 1:0
    }
    print(ans)
}