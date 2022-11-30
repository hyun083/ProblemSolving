//
//  main.swift
//  16916_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let s = readLine()!.map{String($0)}
let p = readLine()!.map{String($0)}
var ans = 0

var start = 0
var end = p.count

for i in 0..<s.count-p.count{
    if Array(s[i..<i+p.count]) == p{
        ans = 1
        break
    }
}
print(ans)
