import Foundation

let T = Int(readLine()!)!
var arr = [[Int]]()
var visited = [Bool]()
var color = [Int]()
var ans = Bool()

func dfs(from curr:Int, currColor:Int){
    for next in arr[curr]{
        if !visited[next]{
            visited[next] = true
            color[next] = currColor==0 ? 1:0
            dfs(from: next, currColor: color[next])
        }else{
            if currColor == color[next]{
                ans = false
            }
        }
    }
}

for _ in 0..<T{
    ans = true
    let (V,E) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr = Array(repeating: [Int](), count: V)
    visited = Array(repeating: false, count: V)
    color = Array(repeating: -1, count: V)
    
    for _ in 0..<E{
        let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
        
        arr[u].append(v)
        arr[v].append(u)
    }
    
    for i in 0..<V{
        if !visited[i] {
            visited[i] = true
            color[i] = 0
            dfs(from: i, currColor: 0)
        }
    }
    print(ans ? "YES":"NO")
}