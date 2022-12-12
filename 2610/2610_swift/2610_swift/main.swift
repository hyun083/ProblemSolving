//
//  main.swift
//  2610_swift
//
//  Created by Hyun on 2022/05/29.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: -1, count: n)
var info = [(a:Int,b:Int)]()
var dist = Array(repeating: Array(repeating: 0, count: n), count: n)

func root(of a:Int)->Int{
    if arr[a]<0 { return a }
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return}
    if arr[rootA] <= arr[rootB]{
        arr[rootB] = rootA
    }else{
        arr[rootA] = rootB
    }
}

for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = line[0]
    let v = line[1]
    union(a: u, b: v)
    dist[u][v] = 1
    dist[v][u] = 1
}

for d in dist{
    print(d)
}
for p in 0..<n{
    for i in 0..<n{
        for k in 0..<n{
            dist[i][k] = max(dist[i][k], dist[i][p] + dist[p][k])
        }
    }
}

