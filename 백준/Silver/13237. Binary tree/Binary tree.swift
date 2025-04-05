import Foundation

let N = Int(readLine()!)!
var root = -1
var map = Array(repeating: [Int](), count: N)
var depth = Array(repeating: 0, count: N)
var visited = Array(repeating: false, count: N)

for i in 0..<N{
    let p = Int(readLine()!)!-1
    if p < 0{
        root = i
    }else{
        map[p].append(i)
    }
}

func dfs(from curr:Int){
    for next in map[curr]{
        if !visited[next]{
            visited[next] = true
            depth[next] = depth[curr] + 1
            dfs(from: next)
        }
    }
}

visited[root] = true
dfs(from: root)

for ans in depth{
    print(ans)
}