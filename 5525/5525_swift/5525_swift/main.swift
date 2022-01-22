//
//  main.swift
//  5525_swift
//
//  Created by Hyun on 2022/01/21.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let S = readLine()!

var compare = "IOI"
for _ in 1..<N{
    compare += "OI"
}

var cnt = 0
for idx in S.indices{
    let temp = S[idx..<S.endIndex]
    if temp.count < compare.count{
        break
    }
    if temp.starts(with: compare){
        cnt += 1
    }
}
print(cnt)
