//
//  main.swift
//  20955_swift
//
//  Created by Hyun on 2022/12/12.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var arr = Array(repeating: -1, count: n)
var cnt = 0

func root(of a:Int) -> Int{
    if arr[a]<0 {return a}
    arr[a] = root(of: arr[a])
    return arr[a]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {
        cnt += 1
        return
    }
    arr[rootB] = rootA
}

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    union(a: info[0], b: info[1])
}

for i in 0..<n{
    if arr[i]<0 { cnt += 1 }
}
print(cnt-1)
