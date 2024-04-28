import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: [-1,-1], count: N)
var total = 0
var visited = Array(repeating: false, count: N)
var rootOf = Array(repeating: -1, count: N)
var ans = 0

for _ in 0..<N{
    let (root,L,R) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1], $0[2])}[0]
    if L>=0{
        map[root][0] = L
        rootOf[L] = root
    }
    if R>=0{
        map[root][1] = R
        rootOf[R] = root
    }
}

func lastNode(node:Int) -> Int{
    if map[node][1] == -1 { return node }
    return lastNode(node: map[node][1])
}

var end = lastNode(node: 0)
var flag = false

func dfs(from node:Int, isRoot:Bool){
    let left = map[node][0]
    let root = rootOf[node]
    let right = map[node][1]
    
    if flag {return}
    
    if left>=0 && !visited[left]{
        ans += 1
        dfs(from: left, isRoot: false)
    }
    
    if flag {return}
    if right>=0 && !visited[right]{
        ans += 1
        dfs(from: right, isRoot: false)
    }
    if flag {return}
    
    if node == end{
        flag = true
        return
    }
    
    if !isRoot { ans += 1}
    visited[node] = true
}

dfs(from: 0, isRoot: true)
print(ans)