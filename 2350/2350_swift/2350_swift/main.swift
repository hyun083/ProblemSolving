//
//  main.swift
//  2350_swift
//
//  Created by Hyun on 2022/12/25.
//

import Foundation

let nmk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]

var arr = Array(repeating: -1, count: n)
var map = Array(repeating: [(Int,Int)](), count: n)
var edges = [(Int,Int,Int)]()
var ans = ""

func root(of a:Int) -> Int{
    if arr[a] < 0{ return a}
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int, b:Int) -> Bool{
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return false}
    arr[rootB] = rootA
    return true
}

func bfs(from a:Int, to b:Int){
    var visited = Array(repeating: false, count: n)
    visited[a] = true
    var q = [(a,201)]
    var idx = 0
    
    while idx<q.count{
        let curr = q[idx].0
        let cost = q[idx].1
        
        if curr == b{
            ans += "\(cost)\n"
            return
        }
        for next in map[curr]{
            if !visited[next.0]{
                visited[next.0] = true
                q.append((next.0,min(cost, next.1)))
            }
        }
        idx += 1
    }
}

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let edge = (info[0]-1,info[1]-1,info[2])
    edges.append(edge)
}
edges.sort(by: { $0.2>$1.2 })

for edge in edges {
    let u = edge.0
    let v = edge.1
    let cost = edge.2
    
    if union(a: u, b: v){
        map[u].append((v,cost))
        map[v].append((u,cost))
    }
}

for _ in 0..<k{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    bfs(from: info[0], to: info[1])
}
print(ans)
