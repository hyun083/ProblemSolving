import Foundation

let N = Int(readLine()!)!
let I = Int(readLine()!)!
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 1...I{
    let node = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    map[node[0]].append(node[1])
    map[node[1]].append(node[0])
}

var cnt = 0
func bfs(from node:Int) {
    visited[node] = true
    cnt += 1
    for next in map[node]{
        if(visited[next] == false){
            bfs(from: next)
        }
    }
}

bfs(from: 0)
print(cnt - 1)