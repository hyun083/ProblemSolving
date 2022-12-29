//
//  main.swift
//  15809_swift
//
//  Created by Hyun on 2022/12/27.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr = Array(repeating: (-1,0), count: n)
func root(of a:Int)-> Int{
    if arr[a].0 < 0 {return a}
    arr[a].0 = root(of: arr[a].0)
    return arr[a].0
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return}
    if arr[rootA].1 >= arr[rootB].1{
        arr[rootA].1 += arr[rootB].1
        arr[rootB].0 = rootA
        arr[rootB].1 = 0
    }else{
        arr[rootB].1 += arr[rootA].1
        arr[rootA].0 = rootB
        arr[rootA].1 = 0
    }
}

func war(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if arr[rootA].1 > arr[rootB].1{
        arr[rootA].1 -= arr[rootB].1
        arr[rootB].0 = rootA
        arr[rootB].1 = 0
    }else if arr[rootA] == arr[rootB]{
        arr[rootA].1 = 0
        arr[rootB].1 = 0
    }else{
        arr[rootB].1 -= arr[rootA].1
        arr[rootA].0 = rootB
        arr[rootA].1 = 0
    }
}

for i in 0..<n{ arr[i].1 = Int(readLine()!)! }
for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    if info[0] == 1{
        union(a: info[1]-1, b: info[2]-1)
    }else{
        war(a: info[1]-1, b: info[2]-1)
    }
}

var ans = [Int]()
for i in 0..<n{
    if arr[i].1 > 0{ ans.append(arr[i].1) }
}
print(ans.count)
for ans in ans.sorted(by: <){ print(ans,terminator: " ") }
