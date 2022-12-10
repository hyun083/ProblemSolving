//
//  main.swift
//  17250_swift
//
//  Created by Hyun on 2022/12/10.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var galaxy = Array(repeating: 0, count: n)
for i in 0..<n{
    let size = Int(readLine()!)!
    galaxy[i] -= size
}

func root(of n:Int) -> Int{
    if galaxy[n] < 0{ return n }
    galaxy[n] = root(of: galaxy[n])
    return galaxy[n]
}

func union(a:Int, b:Int){
    let rootOfA = root(of: a)
    let rootOfB = root(of: b)
    
    if rootOfA == rootOfB {
        print(abs(galaxy[rootOfA]))
    }else if galaxy[rootOfA] <= galaxy[rootOfB]{
        galaxy[rootOfA] += galaxy[rootOfB]
        galaxy[rootOfB] = rootOfA
        print(abs(galaxy[rootOfA]))
    }else{
        galaxy[rootOfB] += galaxy[rootOfA]
        galaxy[rootOfA] = rootOfB
        print(abs(galaxy[rootOfB]))
    }
}

for _ in 0..<m{
    let ab = readLine()!.split(separator: " ").map{Int($0)!-1}
    union(a: ab[0], b: ab[1])
}
