//
//  main.swift
//  1922_swift
//
//  Created by Hyun on 2022/06/15.
//

import Foundation

struct Edge:Comparable{
    let a:Int
    let b:Int
    let c:Int
    init(A:Int,B:Int,C:Int){
        self.a = A
        self.b = B
        self.c = C
    }
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.c < rhs.c
    }
}
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: -1, count: n)
var edges = [Edge]()
var ans = 0
for _ in 0..<m{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = edge[0]-1
    let b = edge[1]-1
    let c = edge[2]
    edges.append(Edge(A: a, B: b, C: c))
}
edges.sort(by: <)
func root(Of n:Int) -> Int{
    if arr[n] < 0 {return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int, c:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfA == rootOfB{
        return
    }
    arr[rootOfB] = rootOfA
    ans += c
}
for edge in edges {
    union(a: edge.a, b: edge.b, c:edge.c)
}
print(ans)
