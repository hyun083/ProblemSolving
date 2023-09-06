import Foundation

func readInt() -> (Int,Int){
    [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
}

func dfs(from curr:Int, moved:Int){
    if ans { return }
    if moved >= 4{ ans = true }
    
    for next in arr[curr]{
        if !visited[next]{
            visited[next] = true
            dfs(from: next, moved: moved+1)
            visited[next] = false
        }
    }
}

let (n,m) = readInt()
var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var ans = false

for _ in 0..<m{
    let (u,v) = readInt()
    arr[u].append(v)
    arr[v].append(u)
}

for i in 0..<n{
    if !ans {
        visited[i] = true
        dfs(from: i, moved: 0)
        visited[i] = false
    }
}
print(ans==true ? 1:0)