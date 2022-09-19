//
//  main.swift
//  A
//
//  Created by Hyun on 2022/09/18.
//

import Foundation

let nl = readLine()!.split(separator: " ").map{Int($0)!}
let n = nl[0]
let l = nl[1]
var names = [[String]]()
var cnt = Array(repeating: 0, count: n)
var ans = "CALL FRIEND"

for _ in 0..<n{
    names.append(readLine()!.map{String($0)})
}

for i in 0..<n{
    for k in 0..<n{
        if i==k{continue}
        var temp = 0
        for p in 0..<l{
            if names[i][p] != names[k][p]{temp += 1}
        }
        cnt[i] = max(cnt[i], temp)
    }
    if cnt[i] <= 1{ans = names[i].joined()}
}
print(ans)
