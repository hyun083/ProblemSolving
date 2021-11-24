//
//  main.swift
//  1260_swift
//
//  Created by Hyun on 2021/11/24.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[0]
let M = inputs[1]
let V = inputs[2]

var map = Array(repeating: Array(repeating: 0, count: inputs[0]), count: inputs[0])
var visited = Array(repeating: false, count: inputs[0])

for _ in 1...M{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    map[edge[0]][edge[1]] = 1
    map[edge[1]][edge[0]] = 1
}

func dfs(_ x:Int){
    print(x+1,terminator: " ")
    visited[x] = true
    for y in 0..<N{
        if map[x][y] == 1 && visited[y] == false{
            dfs(y)
        }
    }
}

func bfs(_ x:Int){
    visited = Array(repeating: false, count: inputs[0])
    visited[x] = true
    var q = [x]
    while (!q.isEmpty){
        let node = q.removeFirst()
        print(node+1,terminator: " ")

        for y in 0..<N{
            if map[node][y] == 1 && visited[y] == false{
                visited[y] = true
                q.append(y)
            }
        }
    }
}

dfs(V-1)
print()
bfs(V-1)

