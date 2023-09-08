import Foundation

let (n,m,r) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1],$0[2]-1)}[0]
var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var ans = Array(repeating: 0, count: n)
var level = 1

for _ in 0..<m{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1,$0[1]-1)}[0]
    arr[u].append(v)
    arr[v].append(u)
}

func dfs(from curr:Int){
    ans[curr] = level
    level += 1
    
    for next in arr[curr].sorted(by: > ){
        if !visited[next]{
            visited[next] = true
            dfs(from: next)
        }
    }
}

visited[r] = true
dfs(from: r)
for ans in ans{
    print(ans)
}