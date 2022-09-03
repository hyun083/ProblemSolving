//
//  main.swift
//  17390_swift
//
//  Created by Hyun on 2022/09/03.
//

import Foundation

let nq = readLine()!.split(separator: " ").map{Int($0)!}
let n = nq[0]
let q = nq[1]

var temp = 0
let psum = [0] + readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <).map{num in
    temp += num
    return temp
}
for _ in 0..<q{
    let lr = readLine()!.split(separator: " ").map{Int($0)!}
    let l = lr[0]-1
    let r = lr[1]
    print(psum[r]-psum[l])
}
