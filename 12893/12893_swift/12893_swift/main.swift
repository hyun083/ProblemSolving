//
//  main.swift
//  12893_swift
//
//  Created by Hyun on 2022/12/28.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr = Array(repeating: -1, count: n)
var ans = 1

func root(of a:Int)->Int{
    if arr[a]<0 {return a}
    arr[a] = root(of: arr[a])
    return arr[a]
}
func union(a:Int,b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB{
        ans = 0
        return
    }
    arr[rootB] = rootA
}

var infos = Set<[Int]>()
for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    infos.insert(info)
}
for info in infos{
    union(a: info[0], b: info[1])
}
print(ans)
