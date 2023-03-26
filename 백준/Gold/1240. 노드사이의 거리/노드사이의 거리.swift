import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var tree = Array(repeating: [Int:Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 1..<N{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let node0 = edge[0]-1
    let node1 = edge[1]-1
    let weight = edge[2]
    tree[node0][node1]=weight
    tree[node1][node0]=weight
}


func dfs(from:Int, to:Int, weight:Int){
    if from==to{
        print(weight)
        return
    }
    if visited[from]{
        return
    }
    visited[from]=true
    for n in tree[from]{
        dfs(from: n.key, to: to, weight: weight+n.value)
    }
}

for _ in 0..<M{
    let range = readLine()!.split(separator: " ").map{Int(String($0))!}
    dfs(from: range[0]-1, to: range[1]-1, weight: 0)
    visited = Array(repeating: false, count: N)
}