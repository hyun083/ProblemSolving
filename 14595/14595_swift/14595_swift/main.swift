//
//  main.swift
//  14595_swift
//
//  Created by Hyun on 2022/12/18.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var rooms = Array(repeating: -1, count: n)

func root(of n:Int)->Int{
    if rooms[n]<0 {return n}
    rooms[n] = root(of: rooms[n])
    return rooms[n]
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    for i in a+1...b{
        rooms[i] = rootA
    }
}

for _ in 0..<m{
    let uv = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = uv[0]
    let v = uv[1]
    union(a: u, b: v)
}

var cnt = 0
for room in rooms{
    if room<0{cnt+=1}
}
print(cnt)
