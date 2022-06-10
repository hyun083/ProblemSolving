//
//  main.swift
//  1976_swift
//
//  Created by Hyun on 2022/06/09.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: -1, count: n)
func root(of n:Int) -> Int{
    if arr[n] < 0 {return n}
    arr[n] = root(of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let a = root(of: a)
    let b = root(of: b)
    if a != b{
        arr[b] = a
    }
}
for u in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for v in 0..<n{
        if input[v] == 1{
            union(a: u, b: v)
        }
    }
}
let cities = readLine()!.split(separator: " ").map{root(of: Int(String($0))! - 1)}
var flag = true
for city in cities{
    if city == cities[0]{
        continue
    }else{
        flag = false
        break
    }
}
if flag{
    print("YES")
}else{
    print("NO")
}
