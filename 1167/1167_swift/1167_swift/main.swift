//
//  main.swift
//  1167_swift
//
//  Created by Hyun on 2022/01/14.
//

import Foundation

let N = Int(readLine()!)!
var tree = Array(repeating: [Int:Int](), count: N)
var visited = Array(repeating: false, count: N)
var diameter = 0
var farderNode = 0

for _ in 0..<N{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in stride(from: 1, to: edge.count-1, by: 2){
        tree[edge[0]-1][edge[i]-1]=edge[i+1]
    }
}

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
dfs(node: farderNode, weight: 0)
print(diameter)
