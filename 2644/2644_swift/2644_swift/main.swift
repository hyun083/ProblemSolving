//
//  main.swift
//  2644_swift
//
//  Created by Hyun on 2021/11/24.
//

import Foundation

let n = Int(readLine()!)!
let destination = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
let m = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: n)
for _ in 1...m{
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    let u = inputs[0]
    let v = inputs[1]
    map[u][v] = 1
    map[v][u] = 1
}

func bfs(from node1:Int, to node2:Int) -> Int{
    var q = Array<Int>()
    q.append(node1)
    visited[node1] = true
    
    var cnt = 0
    while(!q.isEmpty){
        cnt += 1
        for _ in 1...q.count{
            let curr = q.removeFirst()
            for y in 0..<n{
                if map[curr][y] == 1 && visited[y]==false{
                    if(y == node2){return cnt}
                    visited[y] = true
                    q.append(y)
                }
            }
        }
    }
    return -1
}

print(bfs(from: destination[0], to: destination[1]))
