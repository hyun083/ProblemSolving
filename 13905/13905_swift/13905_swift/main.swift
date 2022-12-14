//
//  main.swift
//  13905_swift
//
//  Created by Hyun on 2022/12/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let se = readLine()!.split(separator: " ").map{Int($0)!-1}
let n = nm[0]
let m = nm[1]
let s = se[0]
let e = se[1]

var edges = [(u:Int,v:Int,cost:Int)]()
var house = Array(repeating: -1, count: n)
var cost = 1000001

func root(of n:Int) -> Int{
    if house[n] < 0 {return n}
    house[n] = root(of: house[n])
    return house[n]
}

func union(a:Int, b:Int, c:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB{ return }
    house[rootB] = rootA
    cost = min(cost, c)
}

for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let edge = (line[0]-1,line[1]-1,line[2])
    edges.append(edge)
}
edges.sort(by: { $0.cost > $1.cost })

for edge in edges {
    if root(of: s) == root(of: e){ break }
    union(a: edge.u, b: edge.v, c: edge.cost)
}
print(root(of: s)==root(of: e) ? cost:0)
