//
//  main.swift
//  14582_swift
//
//  Created by Hyun on 2022/08/28.
//

import Foundation

let j = readLine()!.split(separator: " ").map{Int($0)!}
let g = readLine()!.split(separator: " ").map{Int($0)!}
var sumj = 0
var sumg = 0
var ans = "No"
for i in 0..<9{
    sumj += j[i]
    if sumj > sumg{
        ans = "Yes"
    }
    sumg += g[i]
}
print(ans)
