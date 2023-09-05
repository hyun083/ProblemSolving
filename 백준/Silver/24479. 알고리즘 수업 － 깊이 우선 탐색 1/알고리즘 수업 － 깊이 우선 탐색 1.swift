import Foundation

let (n,m,r) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2]-1)}[0]

var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var ans = Array(repeating: 0, count: n)

for _ in 0..<m{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    arr[u].append(v)
    arr[v].append(u)
}
var idx = 1

func dfs(from curr:Int){
    visited[curr] = true
    ans[curr] = idx
    idx += 1
    for next in arr[curr].sorted(by: <){
        if !visited[next]{
            visited[next] = true
            dfs(from: next)
        }
    }
}

dfs(from: r)
for a in ans{
    print(a)
}