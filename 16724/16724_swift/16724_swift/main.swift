//
//  main.swift
//  16724_swift
//
//  Created by Hyun on 2022/12/13.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: Array(repeating: "", count: m), count: n)
var arr = Array(repeating: -1, count: n*m)
var safeZone = 0

func root(of n:Int)->Int{
    if arr[n]<0 { return n}
    arr[n] = root(of: arr[n])
    return arr[n]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA <= rootB{
        arr[rootB] = rootA
    }else{
        arr[rootA] = rootB
    }
}

func dfs(num:Int){
    let curr = root(of: num)
    let x = num/m
    let y = num%m
    var nx = x
    var ny = y
    switch map[x][y]{
    case "U":
        nx -= 1
    case "D":
        nx += 1
    case "L":
        ny -= 1
    case "R":
        ny += 1
    default:
        break
    }
    let next = root(of: nx*m+ny)
    if curr == next{
        return
    }
    union(a: curr, b: next)
    dfs(num: next)
}

for i in 0..<n{
    let line = readLine()!.map{String($0)}
    map[i] = line
}

for i in 0..<n*m{
    dfs(num: i)
}

for i in 0..<n*m{
    if arr[i]<0{
        safeZone += 1
    }
}
print(safeZone)
