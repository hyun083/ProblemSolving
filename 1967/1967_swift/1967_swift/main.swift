//
//  main.swift
//  1967_swift
//
//  Created by Hyun on 2022/01/14.
//

import Foundation

let N = Int(readLine()!)!
var tree = Array(repeating: [Int:Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 1..<N{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let node0 = edge[0] - 1
    let node1 = edge[1] - 1
    let weight = edge[2]
    tree[node0][node1] = weight
    tree[node1][node0] = weight
}

var diameter = 0
var farderNode = 0

func dfs(node:Int, weight:Int){
    if visited[node]{
        return
    }
    visited[node] = true
    if diameter < weight{
        diameter = weight
        farderNode = node
    }
    for n in tree[node]{
        dfs(node: n.key, weight: weight+n.value)
    }
}
dfs(node: 0, weight: 0)
visited = Array(repeating: false, count: N)
diameter = 0
dfs(node: farderNode, weight: diameter)
print(diameter)
