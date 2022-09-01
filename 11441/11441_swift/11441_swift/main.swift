//
//  main.swift
//  11441_swift
//
//  Created by Hyun on 2022/09/01.
//

import Foundation

let n = Int(readLine()!)!
var temp = 0
let psum = [0] + readLine()!.split(separator: " ").map{ num in
    temp += Int(num)!
    return temp
}
for _ in 0..<Int(readLine()!)!{
    let ij = readLine()!.split(separator: " ").map{Int($0)!}
    let i = ij[0]
    let j = ij[1]
    print(psum[j]-psum[i-1])
}
