//
//  main.swift
//  16916_swift
//
//  Created by Hyun on 2022/07/28.
//

import Foundation

let s = readLine()!.map{String($0)}
let p = readLine()!
var ans = 0

var start = 0
var end = p.count

for _ in 0...s.count-p.count{
    if s[start..<end].joined() == p{
        ans = 1
        break
    }else{
        ans = 0
    }
    start += 1
    end += 1
}
print(ans)
