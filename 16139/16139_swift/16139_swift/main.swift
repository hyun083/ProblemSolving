//
//  main.swift
//  16139_swift
//
//  Created by Hyun on 2022/09/01.
//

import Foundation

let str = readLine()!.map{String($0)}
var psum = Array(repeating: [0], count: 26)
for i in 0..<26{
    let alpha = String(UnicodeScalar(UInt8(i+97)))
    var temp = 0
    for a in str{
        if a == alpha{
            temp += 1
        }
        psum[i].append(temp)
    }
}
for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let alpha = Int(line[0].first!.asciiValue!) - 97
    let i = Int(line[1])! + 1
    let j = Int(line[2])! + 1
    print(psum[alpha][j] - psum[alpha][i-1])
}
