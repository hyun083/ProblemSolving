//
//  main.swift
//  1197_swift
//
//  Created by Hyun on 2022/06/10.
//

import Foundation

let ve = readLine()!.split(separator: " ").map{Int(String($0))!}
let v = ve[0]
let e = ve[1]
var arr = Array(repeating: -1, count: v)
var edges = [Edge]()

struct Edge:Comparable{
    var a:Int
    var b:Int
    var c:Int
    init(a:Int,b:Int,c:Int){
        self.a=a
        self.b=b
        self.c=c
    }
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.c<rhs.c
    }
}
func root(of n:Int) -> Int{
    if arr[n]<0 {return n}
    arr[n] = root(of: arr[n])
    return arr[n]
}
func union(a:Int,b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA != rootB{
        arr[rootB] = rootA
    }
}
for _ in 0..<e{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    edges.append(Edge(a: input[0]-1, b: input[1]-1, c: input[2]))
}
edges.sort(by: <)
var mst = 0
for edge in edges {
    let a = edge.a
    let b = edge.b
    let c = edge.c
    if root(of: a) != root(of: b){
        union(a: a, b: b)
        mst += c
    }
}
print(mst)
