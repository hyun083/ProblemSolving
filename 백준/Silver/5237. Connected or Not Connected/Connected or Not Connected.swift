import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    var info:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    let N = info.removeLast()
    let K = info.removeLast()
    
    var map = Array(repeating: Set<Int>(), count: N)
    var visited = Array(repeating: 0, count: N)
    
    for _ in 0..<K{
        let U = info.removeLast()
        let V = info.removeLast()
        if U==V { continue }
        map[U].insert(V)
        map[V].insert(U)
    }
    
    func dfs(from curr:Int){
        for next in map[curr]{
            if visited[next] == 0{
                visited[next] = 1
                dfs(from: next)
            }
        }
    }
    
    visited[0] = 1
    dfs(from: 0)
    let ans = visited.reduce(0,+)
    print(ans==N ? "Connected.":"Not connected.")
}