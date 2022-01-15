//
//  main.swift
//  18126_swift
//
//  Created by Hyun on 2022/01/15.
//

import Foundation

let N = Int(readLine()!)!
var house = Array(repeating: [Int:Int](), count: N)
var visited = Array(repeating: false, count: N)
for _ in 1..<N{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let node0 = edge[0]-1
    let node1 = edge[1]-1
    let cost = edge[2]
    house[node0][node1]=cost
    house[node1][node0]=cost
}
var length = 0
func dfs(node:Int,cost:Int){
    if visited[node]{
        return
    }
    visited[node] = true
    if length < cost{
        length = cost
    }
    for rooms in house[node]{
        dfs(node: rooms.key, cost: cost+rooms.value)
    }
}
dfs(node: 0, cost: 0)
print(length)
