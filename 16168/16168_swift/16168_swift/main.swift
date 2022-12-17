//
//  main.swift
//  16168_swift
//
//  Created by Hyun on 2022/12/16.
//

import Foundation

let ve = readLine()!.split(separator: " ").map{Int($0)!}
let v = ve[0]
let e = ve[1]

var arr = Array(repeating: -1, count: v)
var degrees = Array(repeating: 0, count: v)
func root(of n:Int)->Int{
    if arr[n]<0 {return n}
    arr[n] = root(of: arr[n])
    return arr[n]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB{ return }
    arr[rootB] = rootA
}

for _ in 0..<e{
    let uv = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = uv[0]
    let v = uv[1]
    degrees[u] += 1
    degrees[v] += 1
    union(a: u, b: v)
}

var flag = false
var cnt = 0
var degree = 0
for i in 0..<v{
    if degrees[i]%2 == 1{ degree+=1 }
    if arr[i]<0{ cnt += 1 }
}
if cnt==1 && (degree == 0 || degree == 2) { flag = true }
print(flag ? "YES":"NO")
