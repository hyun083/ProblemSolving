import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NM[0]
    let M = NM[1]
    var tree = Array(repeating: [Int](), count: N)
    var visited = Array(repeating: false, count: N)
    for _ in 1...M{
        let edge = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
        let node0 = edge[0]
        let node1 = edge[1]
        tree[node0].append(node1)
        tree[node1].append(node0)
    }
    var cnt = 0
    func dfs(node:Int){
        if visited[node]{
            return
        }
        visited[node] = true
        for next in tree[node]{
            if !visited[next]{
                cnt += 1
                dfs(node: next)
            }
        }
    }
    dfs(node: 0)
    print(cnt)
}